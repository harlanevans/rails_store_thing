Rails.application.routes.draw do
root "stores#index"

  resources :stores do
    resources :things
  end
end
