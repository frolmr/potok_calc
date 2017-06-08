Rails.application.routes.draw do
  root 'calculator#show'
  post 'calculate_profit' => 'calculator#calculate'
  namespace :api do
    resources :loans, only: [:index, :create]
  end
end
