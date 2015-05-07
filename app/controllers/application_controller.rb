require 'net/https'
require 'json'
class ApplicationController < ActionController::Base  
  protect_from_forgery with: :exception
    $uri = URI.parse("https://localhost/api?apikey=4e230209-078a-4120-817f-9c25822fee36&q=example.com")
	$http = Net::HTTP.new($uri.host,$uri.port)
	$http.use_ssl = true
	$http.verify_mode = OpenSSL::SSL::VERIFY_NONE

	def cif_get		
	  	$request = Net::HTTP::Get.new($uri.request_uri)	  	
	  	response = $http.request($request)
	  	return response 
	end
end
