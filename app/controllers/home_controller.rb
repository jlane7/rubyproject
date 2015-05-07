
require 'net/https'
require 'json'
class HomeController < ApplicationController
  def index  	
	@result = (File.exists?('C:\\') ? `dir /-C` : `df .`).split("\n").last		
	@answer = Array.new
	@answer = @result.split(" ")[4]	
	puts "mao"	
	#output = %x[ #{'sudo su cif'} ]
	#output0 = %x[ #{'export PATH=$PATH:/opt/cif/bin'} ]
	#@output1 = %x[ #{'curl -k -i -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36" -H "Accept => application/json" "https://localhost/api?apikey=4e230209-078a-4120-817f-9c25822fee36&q=example.com"'} ]
	result = %x[ #{'curl -k -i -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36" -H "Accept => application/json" "https://localhost/api?apikey=4e230209-078a-4120-817f-9c25822fee36&q=google.com"'} ]
	@output1=""
	result.gsub!(/.*?(?={)/im,"")
	result = JSON.parse(result.gsub!(/.*?(?={")/im,""))
	key = ""
	value = ""
	table ="<table class='table table-striped'>"
	result.each do |i|
			table+="<tr>"
			i.each do |j|
				table += "<td>"+(j||"")+"</td>"
			end
			table += "</tr>"
			value += (i[1]||"")
	end
	table += "</table>"
	@output1 = table.html_safe
	
  end
end
