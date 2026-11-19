Rails.application.routes.draw do
  resources :restaurants, only: [:index, :show] do
    resources :menu_items, only: [:new, :create]
  end
  root "restaurants#index"

  get "up" => "rails/health#show", as: :rails_health_check
end
