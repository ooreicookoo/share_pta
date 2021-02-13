Rails.application.routes.draw do
  get 'assigns/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :users, only: [:create, :show, :edit, :update]

  root 'users#show'

  resources :teams, shallow: true do
    resources :assigns
    member do
       get :invite
       post :invite_mail
    end
    resources :reports do
      resources :report_comments, only: [:create, :destroy, :edit, :update]
        collection do
        post :confirm
      end
    end
  end

  resources :assigns

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
