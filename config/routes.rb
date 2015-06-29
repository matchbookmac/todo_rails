Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :tasks do
      member do
        get 'complete'
        get 'incomplete'
      end
    end
  end

  resources :tasks
end
