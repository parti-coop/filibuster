Rails.application.routes.draw do
  devise_for :users
  root 'opinions#index'

  resources :opinions do
    shallow do
      resources :votes
      resources :comments
    end
  end
end
