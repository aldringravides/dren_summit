DrenSummit::Application.routes.draw do
  resources :posts
  devise_for :users, path: "",
    path_names: {sign_in: "login", sign_out: "logout"} #,
    # controllers: {omniauth_callbacks: "omniauth_callbacks"}
  root :to => 'page#home'
  match "/auth/:provider/callback" => "authentications#create"
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, :only => [:index, :show, :create, :update, :destroy]
      # resources :users, :only => [:index]
    end
  end
end
