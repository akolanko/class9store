Class9store::Application.routes.draw do

  root to: "home#index"
  resources :users do
   resources :orders
   resources :cards do
    resources :addresses
   end
  end

  get "/signin" => "sessions#new", as: :signin
  post "/signin" => "sessions#create", as: :new_session
  delete "/signout" => "sessions#destroy", as: :signout
  
  resources :categories do
    resources :products
  end

  get "/products" => "products#all", as: :products

  get "/users/:user_id/products/:product_id/order_products/new" => "order_products#new", as: :new_user_product_order_products
  post "/users/:user_id/products/:product_id/order_products" => "order_products#create"
  get "/users/:user_id/products/:product_id/order_products/:id" => "order_products#show", as: :user_product_order_product
  get "/users/:user_id/products/:product_id/order_products" => "order_products#index", as: :user_product_order_products


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
