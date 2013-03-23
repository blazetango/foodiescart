Foodiescart2::Application.routes.draw do
  
  #match '/auth/:provider/callback', to: 'authentications#create'
  match '/auth/:provider/callback' => 'authentications#create'
  #match 'auth/:provider/callback', to: 'sessions#create'
  resources :profiles


  resources :comments
  resources :ratings
  get 'recipes/search', :as => :search
  get "wallets/show"

  resources :order_transactions do
   match ':order_transaction(/:action =>:transact(/:@cart.id))'
 end

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  resources :carts
  resources :current_cart, :controller => "carts", :action=>"show", :id =>"current",  :as => "current_cart"
  resources :orders
  resources :wallets
  resources :line_items do 
   collection do 
     post :selected
   end
  end
   get 'tags/:tag', to: 'recipes#index', as: :tag

  #devise_for :admin_users, ActiveAdmin::Devise.config, ActiveAdmin::Devise.config

  devise_for :users

  #post 'line_items/selected'

  resources :brands

  resources :products do 
    get :autocomplete_brand_name, :on => :collection
    get :autocomplete_ingredient_name, :on => :collection
  end
  
  resources :ingredients do 
   get :autocomplete_ingredient_name, :on => :collection
  end

  resources :ingredient_recipes do
   get :autocomplete_ingredient_name, :on => :collection
  end

   resources :origin_places
  

  resources :recipes
  resources :dashboards


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'dashboards#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
