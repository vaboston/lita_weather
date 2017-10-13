module Lita
  module Handlers
    class Weather < Handler

     ##
     # Chat routes
     ##

        route(/^weather?(\s+(?<city>.*))/, :get_weather, help: { "weater <city>" => "Get weather for city"})
	
        def get_weather(response)
          api_key = 'yourapikeyhere'
	  city = response.match_data[:city] || 'Rennes'
          uri = URI("http://api.openweathermap.org/data/2.5/weather?q=#{city},fr&appid=#{api_key}")
	  resp = Net::HTTP.get(uri) # => String
          weather_jsonyfied = JSON.parse(resp)
          city_name = weather_jsonyfied['name']
          weath = weather_jsonyfied['weather'][0]['main']
          tempK = weather_jsonyfied['main']['temp']
          tempC = (tempK - 273.15 ).round(3)
          response.reply_privately("Weather at #{city_name} :  Weather : #{weath}, Temp : #{tempC}°C")          end
        Lita.register_handler(self)
    end
  end
end

