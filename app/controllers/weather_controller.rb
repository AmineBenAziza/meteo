class WeatherController < ApplicationController
  def search
    if params[:city_id]
      city = City.find(params[:city_id])
      dt = params[:date].present? ? params[:date] : Time.current.tomorrow
      data = $client.current_weather(city: city.name, dt: dt)
      @temp = data.main.temp_c
      if params[:date].present?
        redirect_to home_my_weather_path(temp: @temp, dt: dt, city: city.name)
      else
        redirect_to root_path(temp: @temp, city: city.name )
      end
    else
      flash['error'] = 'city dos not exist'
    end
  end
end
