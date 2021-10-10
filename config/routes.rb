Rails.application.routes.draw do
  root to: 'home#index'
  namespace :hime do
    resources :levels, except: %i[edit destroy]
  end
end
