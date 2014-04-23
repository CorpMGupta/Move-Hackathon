Rails.application.routes.draw do

  root :to => 'home#index'

  get 'home/index'
  get 'home/login'
  get 'home/homepage'

  get 'rating/create'
  get 'rating/new'
  get 'rating/list'
  get 'rating/show'
  get 'rating/update'
  get 'rating/edit'
  get 'rating/destroy'

  get 'category/show'
  get 'category/create'
  get 'category/new'
  get 'category/list'
  get 'category/update'
  get 'category/edit'
  get 'category/destroy'

  get 'judge/create'
  get 'judge/destroy'
  get 'judge/edit'
  get 'judge/list'
  get 'judge/new'
  get 'judge/show'
  get 'judge/update'

  get 'team/list'
  get 'team/show'
  get 'team/edit'
  get 'team/update'
  get 'team/create'
  get 'team/new'
  get 'team/destroy'

  post 'home/login'

  post 'team/create'
  post 'team/update'
  delete 'team/destroy'

  post 'category/create'
  post 'category/update'
  delete 'category/destroy'

  post 'judge/create'
  post 'judge/update'
  delete 'judge/destroy'

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
