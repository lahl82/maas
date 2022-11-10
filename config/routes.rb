# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :allocations
      resources :availables
      resources :contracts do
        resources :days
        resources :technicians
        resources :weeks do
          resources :allocations do
            post 'generate', on: :collection
          end
        end
      end

      resources :days do
        resources :blocks
      end
      resources :technicians
      resources :weeks do
        resources :availables
        resources :allocations
      end
    end
  end
end
