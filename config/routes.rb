Rails.application.routes.draw do
  post 'weather/search'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "home#index"
  get 'home/my_weather'
  devise_for :users

end
