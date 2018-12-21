Rails.application.routes.draw do
  root 'application#welcome'
  resources :users, only: [:show, :new, :create, :update, :edit]
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '*path' => redirect('/')
end
