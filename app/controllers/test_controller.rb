class TestController < ApplicationController
  def test
  	puts "mao"
  	result = %x[ #{'curl -k -i -A "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1664.3 Safari/537.36" -H "Accept => application/json" "https://localhost/api?apikey=4e230209-078a-4120-817f-9c25822fee36&q=google.com"'} ]
	#respond_to :html, :json
	@output1=""
	#parse = JSON.parse response.body
	
	#@output1 = JSON.parse(@output1)
	result.gsub!(/.*?(?={)/im,"")
	#result.slice(result.index("{")..-1)
	#@output = result[/({).*$/i]
	#@output1 = result.slice(result.index("{")..-1)
	result = JSON.parse(result.gsub!(/.*?(?={")/im,""))
	#result.collect {|item| item['restriction']}
	key = ""
	value = ""
	table ="<table class='table'>"
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
	#@output1=result[1]
	#@output1= result["restriction"]
	#@output1 = cif_get
	#result = JSON.parse(result)
	#@output1 = result		
	
	#result.each_char do |i|		
		#if i.eql? '{'
			#return @output1 = result;
		#end
		#result = result.remove(i)				
	#end
	#@output1 = result
	
	end

end