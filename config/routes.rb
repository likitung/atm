Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: 'json' } do
    namespace :v1, defaults: { format: 'json' } do
      resources :atms, only: %i[create] do
        member do
          post 'deposit'
        end
      end
      resources :banknotes, only: %i[create]
    end
  end
  root to: 'api/v1/uptime#show'
end
