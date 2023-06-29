class HomeController < ApplicationController
  before_action :authenticate_user!, only: :my_weather
  def index
    redirect_to new_user_session_path unless user_signed_in?
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
