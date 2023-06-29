class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = City.all
    @temp = params[:temp]
    @city = params[:city]
  end
end
