Rails.application.routes.draw do
  resources :reports do
    collection do
      post :confirm
    end
  end
end
