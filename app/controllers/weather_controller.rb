class WeatherController < ApplicationController
  before_action :authenticate_user!
  before_action :set_date, only: :search

  def search
    set_city do
      @temp = Weather.current_weather(city: @city.name, dt: @date).main.temp_c
      if params[:date].present?
        redirect_to weather_my_weather_path(temp: @temp, date: @date, city: @city.name)
      else
        redirect_to root_path(temp: @temp, city: @city.name)
      end
    end
  end

  def my_weather
    @date = params[:date]
    @city = params[:city]
    @temp = params[:temp]
  end

  private

  def set_city
    @city = City.find_by(id: params[:city_id])
    if @city.present?
      yield
    else
      flash[:alert] = "Add city on your profile first"
      redirect_to edit_user_registration_path
    end
  end

  def set_date
    @date = params[:date].present? ? params[:date] : Time.current.tomorrow
  end
end
