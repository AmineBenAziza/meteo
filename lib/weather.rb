class Weather
  attr_reader :client

  def initialize
    @client = OpenWeather::Client.new(
      api_key: Rails.application.credentials.open_weather_map_key
    )
  end

  def self.current_weather(**args)
    new.client.current_weather(**args)
  end
end
