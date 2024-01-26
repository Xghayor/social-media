Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users
  root 'users#index'

  namespace :api do
    namespace :v1 do
      resources :posts, only: [:index] do
        resources :comments, only: [:index, :create]
      end
    end
  end

  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end
