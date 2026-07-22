Rails.application.routes.draw do
  root "todos#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :todos do
    member do
      patch :toggle
    end
  end
end
