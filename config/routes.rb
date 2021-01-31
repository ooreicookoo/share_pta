Rails.application.routes.draw do
  root 'reports#index'
  get 'teams/index'
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

  resources :assigns, only: %w(create destroy)
  resources :report_comments

  resources :teams

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
