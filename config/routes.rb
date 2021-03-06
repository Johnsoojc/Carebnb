Rails.application.routes.draw do
  get 'listings/index'

  root 'welcome#index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  resources :taggings

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"


  resources :users, controller: "users", only: [:show, :edit,:update]
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"

  resources :listings do
    resources :bookings, controller:"bookings", only: [:create, :new]
  end

  get "/mylisting" => "listings#mylisting"

  resources :bookings, only: [:destroy]

end
