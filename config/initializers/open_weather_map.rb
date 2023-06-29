$client = OpenWeather::Client.new(
  api_key: Rails.application.credentials.open_weather_map_key
)