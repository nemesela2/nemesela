Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  namespace :api do
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
          sessions: 'custom_devise_token_auth/sessions'
      }
      resources :posts, only: [:index]
    end
  end

  root to: 'posts#index'
end
