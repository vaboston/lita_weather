require "lita"
require "net/http"
require "json"
require "lita/handlers/weather"
Lita.load_locales Dir[File.expand_path(
	  File.join("..", "..", "locales", "*.yml"), __FILE__
)]
