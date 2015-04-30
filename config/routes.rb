Rails.application.routes.draw do

  namespace :mobile do
    resources :start_ups
    resources :registrations
    get "sign_up_hint" => "static#sign_up_hint"
  end

  namespace :weixin do
    devise_scope :user do
      resources :sessions
    end
    resources :messages, only: [:index] do 
      collection do 
        match 'receive' => 'messages#receive', via: [:get, :post]
      end
    end
    resources :topics
    resources :users, only: :index
  end

  resources :places

  resources :topic_comments do
    put :up, on: :member
  end

  resources :topics do 
    put :up, on: :member
    put :wanna_join, on: :member
  end
  resources :invitation_codes
  resources :remarks, only: [:create, :update]
  resources :invitations, only: [:create, :new, :update] do
    put :as_read, on: :member
  end
  devise_scope :user do
    put '/update_registration/:registration_id' => 'custom_devise/registrations#update', :as => :update_user_registration
  end
  devise_for :users, 
             :controllers => { :registrations => "custom_devise/registrations", :confirmations => "custom_devise/confirmations", :sessions => "custom_devise/sessions"}
  post "/resend_confirmation_email" => "custom_devise#resend_confirmation_email", as: :resend_confirmation_email
  resources :users do 
    get :uptoken, on: :collection
    get :me, on: :collection
    get :profile, :member
    put :update_avatar, on: :member
  end

  root 'users#index'
  resources :start_ups do 
    put :like, on: :member
    put :up, on: :member
  end

  get '/about' => 'static#about'
  get '/policies' => 'static#policies'

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
