class WeatherController < ApplicationController
  def search
    if params[:city_id].present?
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
      redirect_to home_my_weather_path
      flash[:alert] = "add city on your profile first"
    end
  end
end
