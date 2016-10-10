DrenSummit::Application.routes.draw do
  resources :posts
  devise_for :users, path: "",
    path_names: {sign_in: "users/login", sign_out: "users/logout"},
    controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root :to => 'page#home'
  # devise_scope :user do
  #   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  # end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, :only => [:index, :show, :create, :update, :destroy]
      # resources :users, :only => [:index]
    end
  end
  # match 'auth/twitter/callback', to: 'sessions#create'
end
