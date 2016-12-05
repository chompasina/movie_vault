Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "movies#index"
  
  resources :users, only: [:new, :create]
  resources :movies, only: [:index, :new, :create, :edit, :update, :show]
  resources :tags
  
  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index, :update, :show, :create, :edit, :destroy]
    end
  end
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  
end
