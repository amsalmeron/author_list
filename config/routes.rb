Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/authors', to: 'authors#index'
  get '/authors/new', to: 'authors#new'
  get '/authors/:id', to: 'authors#show'
  post '/authors', to: 'authors#create'
  get '/authors/:id/edit', to: 'authors#edit'
  patch '/authors/:id', to: 'authors#update'

  get '/books', to: 'books#index'
  get '/books/:id', to: 'books#show'

  get '/authors/:id/books', to: 'authors_books#index'
  get '/authors/:id/books/new', to: 'authors_books#new'
  post '/authors/:id/books', to: 'authors_books#create'
end
