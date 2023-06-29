Rails.application.routes.draw do
  root to: 'home#index'

  post 'weather/search'
  get 'weather/my_weather'

  devise_for :users
end
