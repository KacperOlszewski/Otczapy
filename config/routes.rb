Myapp::Application.routes.draw do

  get "cats/index"
  get "cats/new"
  get "cats/edit"
  get "cats/delete"
  get "workshops/index"
  get "workshops/show"
  get "workshops/new"
  get "workshops/edit"
  get "workshops/delete"
  get "workshop/index"
  get "workshop/show"
  get "workshop/new"
  get "workshop/edit"
  get "workshop/delete"
scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  get 'public/index'
  get 'public/about'
  get 'public/offer'
  get 'public/gallery'
  get 'public/photos'
  get 'public/calendar'
  get 'public/contact'
end


get 'admin', :to => "access#index"
  # You can have the root of your site routed with "root"
root to: 'public#index'

match ':controller(/:action(/:id))', :via => [:get, :post]
  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
mount Ckeditor::Engine => '/ckeditor'
 
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
