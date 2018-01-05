Rails.application.routes.draw do
  root to: "owners#index"

  resources :owners do
    resources :machines, only: [:index]
  end

  resources :machines do
    resources :snacks, only: [:show]
  end

  resources :snacks, only: [:show]
end
