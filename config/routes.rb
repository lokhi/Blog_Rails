Blog::Application.routes.draw do

match '/posts' => 'posts#index', :as => :posts, :via => :get
match '/posts/new' => 'posts#new', :as => :new_post, :via => :get
match '/posts' => 'posts#create', :via => :post
match '/posts/:id/edit' => 'posts#edit', :as => :edit_post, :via => :get
match '/posts/:id' => 'posts#update', :via => :put
match '/posts/:id' => 'posts#show', :as => :show_post, :via => :get
match '/posts/:id' => 'posts#delete', :as => :delete_post, :via => :delete
match '/posts/:post_id/comments' => 'comments#create', :via => :post
match '/posts/:post_id/comments/:id' => 'comments#delete', :as => :delete_comment, :via => :delete
match '/posts/search' => 'posts#search', :via => :post
match '/session/new' => 'session#new', :as => :new_session, :via => :get
match '/session' => 'session#create', :via => :get
match '/session' => 'session#delete', :as => :delete_session, :via => :delete
match '/contact/create' => 'contact#create', :via => :post



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
  root :to => 'posts#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
