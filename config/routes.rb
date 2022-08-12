Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "bookings#index"

  resources :bookings, only: [:index]

  resources :bookings, only: [:new, :edit, :create, :update, :destroy], defaults: { format: :turbo_stream } do
    get :delete, on: :member, defaults: { format: :turbo_stream }
  end

  namespace :api do
    namespace :v1 do
      resources :bookings, only: [:index, :create, :update, :destroy]
    end
  end
end
