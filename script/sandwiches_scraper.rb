require File.expand_path('../../config/environment',  __FILE__)

require File.expand_path('../../config/boot',  __FILE__)

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'json'

sammiches = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_sandwiches"))

class Scraper
  
def initialize
  @url = "http://en.wikipedia.org/wiki/List_of_sandwiches"
  @nodes = Nokogiri::HTML(open(@url))
  
end

def summary

  sammich_data = @nodes
  
  sammiches = sammich_data.css('div.mw-content-ltr table.wikitable tr') 
     sammich_data.search('sup').remove
    
    sammich_hashes = sammiches.map {|x| 
     
      if content = x.css('td')[0]
        name = content.text
      end
       if content = x.css('td a.image').map {|link| link ['href']}
        image =content[0]
      end
      if content = x.css('td')[2]
        origin = content.text
      end
       if content = x.css('td')[3]
        description =content.text
      end
    
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
sammichy.summary
puts "atta boy"

