class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = City.all
    @temp = params[:temp]
    @city = params[:city]
  end

  def my_weather
    @date = params[:dt]
    @city = params[:city]
    @temp = params[:temp]
  end
end
