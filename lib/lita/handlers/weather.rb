module Lita
  module Handlers
    class Weather < Handler

     ##
     # Chat routes
     ##

        route(/^meteo?(\s+(?<city>.*))/, :get_meteo, help: { "meteo <city>" => "Get meteo for city"})
	
        def get_meteo(response)
          api_key = '83cf96f95d89ec153a330ce1596d3d12'
	  city = response.match_data[:city] || nil
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

