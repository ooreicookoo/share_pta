Rails.application.routes.draw do
  get 'assigns/create'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :users, only: [:create, :show, :edit, :update]

  root 'top#index'

  resources :teams, shallow: true do
    resources :assigns
    member do
       get :invite
       post :invite_mail
    end
  end

  resources :reports, only: [] do
    resources :report_comments, only: [:create, :destroy, :edit, :update]
    #   collection do
    #   post :confirm
    # end
  end

  resources :teams do
    resources :reports do
      post :confirm, on: :collection # on: :member
    end
  end

  resources :assigns

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
