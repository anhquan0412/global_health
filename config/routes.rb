Rails.application.routes.draw do


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#home'


  resources :projects do
     # create a like path for a recipe
    member do
      post 'like'
      post 'approve'
    end
    
    collection do
      match 'search' => 'projects#search', via: [:get, :post], as: :search
    end
  end


  resources :users, except: [:new, :destroy] do
    member do
      post 'approve'
    end
    
    collection do
      match 'search' => 'users#search', via: [:get, :post], as: :search
    end
  end
  #url for new should be /register
  get '/register', to: 'users#new'

  
  get '/pending_users', to: 'users#pending'
  get '/pending_projects', to: 'projects#pending'


  #login -> new session
  get '/login', to: "logins#new"
  #logout -> close session
  post '/login', to: "logins#create"
  #post login -> create session
  get '/logout', to: "logins#destroy"

  # resources :search,only: :index do
  #   match 'user_advanced' => 'search#user_advanced',
  #   on: :collection, via: [:get, :post], as: :user_advanced
    
  # end
  

  # get '/search_project',to: 'search#project'

  resources :specialties

  resources :institutions
  
  resources :password_resets

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
