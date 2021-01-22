Rails.application.routes.draw do
  devise_for :users
  resources :reports do
    collection do
      post :confirm
    end
  end
  root 'reports#index'

  # if Rails.env.development?
  #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  # end
end
