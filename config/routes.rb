Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resource :calendar, only: [:index] do
        namespace :authorization do
          get :url
          post :access
        end
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
