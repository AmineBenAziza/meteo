module Api::V1
  class WeatherController < ApplicationController
    def avreage
      weathers = []
      cities = params[:cities].split(',')
      cities.each do |city|
        weathers.push(Weather.current_weather(city: city).main.temp_c)
      end
      result = (weathers.sum() / weathers.size).round(2)

      if result.present?
        render json: {status: "SUCCESS", message: "avreage weather for cities", data: result}, status: :ok
      else
        render json: {status: :bad_request}
      end
    end
  end
end