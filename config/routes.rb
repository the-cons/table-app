Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  resources :restaurants, only: [ :index, :show ] do
    resources :menu_items, only: [ :new, :create, :edit, :update, :destroy ]
  end
  root "restaurants#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
