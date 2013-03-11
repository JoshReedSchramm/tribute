Tribute::Application.routes.draw do
  resources :pages, :except => [:show, :update, :destroy]

  devise_for :users,
    controllers: {
      omniauth_callbacks: "users/omniauth_callbacks"
    },
    path: "",
    path_names: {
      sign_up: "signup",
      sign_in: "login",
      sign_out: "logout"
    }

  namespace :admin do
    root :to => 'home#index'
    resources :templates
  end

  root :to => 'home#index'

  get ":id", to: 'pages#show', as: "page"
  put ":id", to: 'pages#update', as: "page"
  delete ":id", to: 'pages#destroy', as: "page"
end
