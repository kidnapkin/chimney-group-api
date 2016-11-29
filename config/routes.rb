Rails.application.routes.draw do
  resources :posts
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  

  namespace :api, defaults: { format: :json },
                              constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do
      get '/posts', to: 'posts#index'
    end
  end
end
