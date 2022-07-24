Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :categories do
    resources :tasks
  end

  delete '/categories/:category_id/tasks/:id' => 'pages#destroy', as: 'delete_task'

  root to: 'pages#index'

end
