Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/categories' => 'categories#index'

  get '/categories/:id' => 'categories#show'

  get '/categories/new' => 'categories#new'

  post '/categories' => 'categories#create'

end
