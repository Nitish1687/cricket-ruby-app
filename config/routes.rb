Rails.application.routes.draw do
  root "players#index"

  resources :players do
    resources :brands
  end
end
