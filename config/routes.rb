Rails.application.routes.draw do
  get 'assigns/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :users

  resources :reports do
    resources :report_comments, only: [:create, :destroy, :edit, :update]
    collection do
      post :confirm
    end
  end
  root 'reports#index'

  resources :assigns, only: [:create]

  resources :teams do
    member do
     get :invite
     post :invite_mail
   end
 end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
