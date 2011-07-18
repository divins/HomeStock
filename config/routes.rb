Homestock::Application.routes.draw do
  # devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get '/users/auth/:provider' => 'users/omniauth_callbacks#passthru'
  end

  # resources :pages
  # match '/' => 'pages#show', :id => 'home'
  root to: "pages#home"

  namespace :user do
    resources :items

    root to: "items#index"
  end
end
