Rails.application.routes.draw do

  resources :items

  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'
  
   get 'products/create'
   
get 'products/show'

get 'products/update'

get 'products/destroy'

get 'products/new'

  get 'carts/show'

  get 'products/index'

  resources :menus

  get 'reviews/restaurant_reviews' => "reviews#restaurant_reviews"
  get 'reviews/item_reviews' => "reviews#item_reviews"
  resources :reviews
  get "/signin" => "sessions#new"
  get "/signout" => "sessions#destroy"
  #post "/sign_in" => "authentication#login"
  #get "sign_in" => "authentication#sign_in"

  get 'extra/privacy'

  get 'extra/adv'

  get 'pages/home'

  get 'pages/menu/:id' => "pages#menu"
  get '/menus/new/:id' => "menus#new"
  get '/cart' => "shopping_carts#index"

  get 'pages/about'


  resources :relationships

  resources :moneyinfos

  resources :bookings

  resources :posts

  resources :caterings

  resources :users

  resources :restaurants

  resources :categories

  resources :sessions
  #
  get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'
  
  

  resources :shopping_carts do
    collection do
      get 'add'
      get 'remove'
    end
  end
  #
  #get '/signin', :to => 'sessions#new' #, :as => :signin
  #get '/signout' => 'sessions#destroy', :as => :signout
  #
  get '/search' => 'items#search', :as => :search


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root :to => 'pages#home'

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
