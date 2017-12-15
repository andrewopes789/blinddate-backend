Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "static_pages#root"

  namespace :api, defaults: { format: :json } do
    resource :session, only: %i(create destroy)
    resources :users, only: %i(index create show update) do
      resources :messages, only: %i(index create)
      resources :eligibles, only: %i(index create)
      resources :matches, only: %i(index create)
      resources :potentials, only: %i(index create)
      member do
        delete 'eligible', to: 'eligibles#destroy'
        delete 'potential', to: 'potentials#destroy'
        delete 'match', to: 'matches#destroy'
      end

    end
  end
end
