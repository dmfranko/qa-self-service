Qaselfservice::Application.routes.draw do
  get "static_pages/about"
  get "apps/index"
  get "reports/index"
  get "selfservice/index"
  get 'application/logout'
  get 'static_pages/about'
  get 'about/table_test'
  get 'about/summary'
  
  resources :applications
  resources :application_user_permissions
  resources :users
  resources :selfservice
  resources :uploads
  resources :reports
  resources :runs
  resources :runners
  resources :run_details
  resources :platforms
  
  resources :pages
  resources :page_tests
  resources :captured_page_images
  
  resources :tests do
    collection do
      get 'pending_test'
      post 'new_test_run'
      post 'end_test_run'
    end
  end

  resources :test_platforms do
    collection do
      get 'pending_platform'
    end
  end
  resources :test_result_details
  resources :test_hierarchy
  
  resources :report_services do
    collection do
      get 'addGroup'
      get 'addResult'
    end
  end
  
  resources :images, only: [:index, :new, :create, :destroy]
  
  # Not using resque web at the moment
  ResqueWeb::Engine.eager_load!
  require "resque_web"
  mount ResqueWeb::Engine => "/resque_web"

  # Should these requires be here?
  require 'resque'
  require 'resque/server'
  require 'resque_scheduler'
  require 'resque_scheduler/server'
  mount Resque::Server.new, :at => '/resque'
  
  require 'sidekiq/web'
  require 'sidekiq-status/web'
  mount Sidekiq::Web => '/sidekiq'
  
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
  root :to => 'selfservice#index'

# See how all your routes lay out with "rake routes"

# This is a legacy wild controller route that's not recommended for RESTful applications.
# Note: This route will make all actions in every controller accessible via GET requests.
# match ':controller(/:action(/:id))(.:format)'
end
