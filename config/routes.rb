Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/show'
  devise_for :users
  resources :users

  resources :reports do
    collection do
      post :confirm
    end
  end
  resources :report_comments
  root 'reports#index'

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
