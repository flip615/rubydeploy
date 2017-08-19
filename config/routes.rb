Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/delete'

  get 'bright_ideas/index'

  get 'bright_ideas/create'

  get 'bright_ideas/show'

  get 'bright_ideas/delete'

  get 'users/index'

  get 'users/create'

  get 'users/show'

  get 'sessions/create'

  get 'sessions/destroy'
  
  post 'login' => 'sessions#create'


root 'application#index'
post 'users' => 'users#create'
 get 'users/:id' => 'users#show'
 get 'bright_ideas' => 'bright_ideas#index'
 post 'bright_ideas' =>'bright_ideas#create'
 get 'delete/:idea_id' => 'bright_ideas#delete'
get 'like/:idea_id' => 'likes#create'
get 'unlike/:idea_id' => 'likes#delete'
get 'bright_ideas/:id' => 'bright_ideas#show'


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
