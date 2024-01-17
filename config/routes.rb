Rails.application.routes.draw do
  root 'users#index'
  
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
