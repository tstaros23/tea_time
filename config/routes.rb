Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:show] do
        resources :subscriptions, only: [:create, :index, :update]
      end
    end
  end
end
