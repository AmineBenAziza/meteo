Rails.application.routes.draw do
  root to: 'home#index'

  post 'weather/search'
  get 'weather/my_weather'

  devise_for :users

  namespace :api do
    namespace :v1 do
      post '/weather', to: 'weather#avreage', as: :avreage_weather
    end
  end
end
