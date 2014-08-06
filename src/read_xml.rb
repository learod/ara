require 'nokogiri'
require 'open-uri'

# Get a Nokogiri::HTML::Document for the page we’re interested in...

doc = Nokogiri::XML(open(ENV['URL_XML']))

####
# Search for nodes by xpath
doc.xpath('//ajax-response/RedEstaciones/Estacion').each do |link|
  puts "#{link.xpath("nombre").text}: #{link.xpath("numero").text}"
end
