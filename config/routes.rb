Rails.application.routes.draw do

   resources :books
   resources :users, except: [:index, :destroy]
   get '/sessions' => 'sessions#destroy'
   resources :sessions, only: [:new, :create, :destroy]

   root 'books#index'
end
