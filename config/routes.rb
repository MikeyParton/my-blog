Rails.application.routes.draw do
	
	root "articles#index"
  	resources :articles do
  		resources :comments
	end
	resources :tags
  
	get "/new", to:"articles#new"
	post "/new", to:"articles#create"

end