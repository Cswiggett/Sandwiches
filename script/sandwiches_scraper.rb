require File.expand_path('../../config/environment',  __FILE__)

require File.expand_path('../../config/boot',  __FILE__)

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'json'


class Scraper
  
def initialize
 
doc = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_sandwiches"))  
doc.search('sup').remove
  
  sammich_hashes = doc.css('table.wikitable tr').map { |tr| 
  name, image, origin, description = tr.css('td,th')
  name, origin, description = [name, origin, description].map{ |n| n && n.text ? n.text : nil }
  image = image.at('img')['src'] rescue nil
    
   {
      :name => name,
      :image => image,
      :origin => origin,
      :description => description,
    }
    Sammich.create(:name => name, :description => description, :image => image, :country => origin)
        }
   
   end
  end

sammichy = Scraper.new
sammichy.initialize
puts "atta boy"

