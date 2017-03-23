Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'yelp_reviews#index'
  get '/search', to: 'yelp_reviews#search'
end
