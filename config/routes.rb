MyApp::Application.routes.draw do
  get 'products/new' => 'products#new', as: :new_product
  get 'products' => 'products#index', as: :products
  post 'products' => 'products#create'
  
  root to: 'products#index'
end
