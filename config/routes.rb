Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'authors#index'
  # get '/authors', to: 'authors#index'
  # get '/authors/new', to: 'authors#new'
  # get '/authors/:id', to: 'authors#show'
  # post '/authors', to: 'authors#create'
  # get '/authors/:id/edit', to: 'authors#edit'
  # patch '/authors/:id', to: 'authors#update'
  # delete '/authors/:id', to: 'authors#destroy'
  resources :authors
  # get '/books', to: 'books#index'
  # get '/books/:id', to: 'books#show'
  # get '/books/:id/edit', to: 'books#edit'
  # post '/books/:id', to: 'books#update'
  # delete '/books/:id', to: 'books#destroy'
  resources :books, except: [:new, :create]
  
  get '/authors/:id/books', to: 'authors_books#index'
  get '/authors/:id/books/new', to: 'authors_books#new'
  post '/authors/:id/books', to: 'authors_books#create'
end
