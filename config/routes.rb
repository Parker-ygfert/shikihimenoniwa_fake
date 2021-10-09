Rails.application.routes.draw do
  root to: 'home#index'
  namespace :hime do
    resources :levels
  end
end
