Rails.application.routes.draw do
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments
      resources :likes
    end
  end
end
