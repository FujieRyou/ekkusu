Rails.application.routes.draw do
  get 'favorites/index'
  get 'favorites/create'
  get 'favorites/destroy'
  get 'relationships/create'
  get 'relationships/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'toppages/index'
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  get "logout", to: "sessions#destroy"
  get "posts/new" => "posts#new"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  root to: 'toppages#index'
  
  get "signup", to: "users#new"
  resources :users do
    member do
      get :followings
      get :followers
      get :favorites
    end
    collection do
      get :search
    end
  end
  
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resources :favorites, only: [:create, :destroy, :index]
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:index, :create, :destroy]
end
