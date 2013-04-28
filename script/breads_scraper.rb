#APP_PATH = File.expand_path('../../config/application',  __FILE__)
require File.expand_path('../../config/environment',  __FILE__)

require File.expand_path('../../config/boot',  __FILE__)

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'uri'
require 'json'

url = Nokogiri::HTML(open("http://en.wikipedia.org/wiki/List_of_breads"))

class Scraper 
  
def initialize
  @url = "http://en.wikipedia.org/wiki/List_of_breads"
  @nodes = Nokogiri::HTML(open(@url))
  
end

def summary

  bread_data = @nodes
  
  breads = bread_data.css('div.mw-content-ltr table.wikitable tr') 
     bread_data.search('sup').remove
    
    bread_hashes = breads.map {|x| 
     
      if content = x.css('td')[0]
        name = content.text
      end
       if content = x.css('td a.image').map {|link| link ['href']}
        image =content[0]
      end
      if content = x.css('td')[2]
        type = content.text
      end
       if content = x.css('td')[3]
        country = content.text
      end
       if content = x.css('td')[4]
        description =content.text
      end
    
   {
      :name => name,
      :image => image,
      :type => type,
      :country => country,
      :description => description,
    }
    Bread.create(:title => name, :description => description, :image_url => image, :country_origin => country, :type => type)
        }
   
   end
end
bready = Scraper.new
bready.summary
puts "atta boy"
