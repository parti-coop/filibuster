Rails.application.routes.draw do
  devise_for :users
  root 'opinions#index'

  resources :opinions do
    member do
      patch :agree
      patch :disagree
    end
    shallow do
      resources :comments
    end
  end
end
