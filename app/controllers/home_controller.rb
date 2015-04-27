
class HomeController < ApplicationController
  def index
	@result = (File.exists?('C:\\') ? `dir /-C` : `df .`).split("\n").last		
	@answer = Array.new
	@answer = @result.split(" ")[4]	
	puts "mao"	
	#output = %x[ #{'sudo su cif'} ]
	#output = %x[ #{'export PATH=$PATH:/opt/cif/bin'} ]
	#output1 = %x[ #{'cif -d -M -q google.com'} ]
	#puts output
  end
end
