Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :users

  resources :reports do
    collection do
      post :confirm
    end
  end
  root 'reports#index'
  
  resources :report_comments

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
