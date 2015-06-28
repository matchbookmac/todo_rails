Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :tasks do
      get 'complete', on: :member
    end
  end
end
