Kimaya::Application.routes.draw do 

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :controllers => {:registrations => "admin/home", :sessions => "sessions", :confirmations => "confirmations", invitations: "users/invitations"} do 
    match '/hospitals/:hospital_id/reset_password' => 'admin/home#reset_password', as: :reset_password
  end

  match 'hospitals/:hospital_id' => "home#index"
  
  resources :hospitals do
    resources :home
    resources :users, path: "/users/:type" 
    resources :additives
    resources :reports

    resources :patients do
      match 'history'
      collection do
        post 'search'
      end
      resources :investigations 
    end
    resources :tpns
    resources :tpn_market_additives
    resources :tpn_infusions
    match 'tpns/report/:id' => 'tpns#report', :via => :get
    match 'tpns/label/:id' => 'tpns#label', :via => :get
    match 'tpn/previous_tpn' => 'tpns#previous_tpn'
    match 'tpn/previous_tpn_date' => 'tpns#previous_tpn_date'
  end
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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
