Rails.application.routes.draw do
  namespace :api do
    resources :loans
  end
end
