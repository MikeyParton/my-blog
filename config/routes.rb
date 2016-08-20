Rails.application.routes.draw do
  resources :articles

  root "articles#index"
  get "/new", to:"articles#new"
  post "/new", to:"articles#create"

end