class WeatherController < ApplicationController
  def search
    if params[:city_id]
      city = City.find(params[:city_id])
      data = $client.current_weather(city: city.name, dt: Time.current.tomorrow)
      @temp = data.main.temp_c

      redirect_to root_path(temp: @temp)
    else
      flash['error'] = 'city dos not exist'
    end
  end
end
