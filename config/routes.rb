Rails.application.routes.draw do
  get "/", to: 'products#index'
  get "/products", to: 'products#index'
  get "/products/new", to: 'products#new'
  post "/products/search", to: 'products#search'
  get "/products/:id", to: 'products#show'
  post "/products", to: 'products#create'
  get "/products/:id/edit", to: 'products#edit'
  patch "/products/:id", to: 'products#update'
  delete "/products/:id", to: 'products#destroy'

  get "/images", to: 'images#index'
  get "/images/:id", to: 'images#show'

  get "/signup", to: "users#new"
  post "/users",  to: "users#create"

  delete "/logout/:id", to: 'sessions#destroy'
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  
  get "/orders/:id", to: 'orders#show'
  patch "/orders/:id", to: 'orders#update'

  
  get "/carted_products", to: 'carted_products#index'
  post "/carted_products", to: 'carted_products#create'
  delete "/carted_products/:id", to: 'carted_products#destroy'

end 
   
