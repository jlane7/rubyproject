
class HomeController < ApplicationController
  def index
	@result = (File.exists?('C:\\') ? `dir /-C` : `df .`).split("\n").last		
	@answer = Array.new
	@answer = @result.split(" ")[4]	
	puts "mao"	
	#output = %x[ #{'sudo su cif'} ]
	#output0 = %x[ #{'export PATH=$PATH:/opt/cif/bin'} ]
	@output1 = %x[ #{'curl -k -i -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36" -H "Accept => application/json" "https://localhost/api?apikey=4e230209-078a-4120-817f-9c25822fee36&q=example.com"'} ]
	#puts output
	#puts output0
	
  end
end
