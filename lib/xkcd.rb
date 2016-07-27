require 'open-uri'
require 'nokogiri'
require 'faraday'

class Xkcd
  BASE_URL = 'http://c.xkcd.com'
  TEMP_IMAGE = 'random-xkcd.png'.freeze

  class << self
    def random_comic
      doc = Nokogiri::HTML(open(BASE_URL + '/random/comic/'))
      img = doc.css('#comic img').first.attributes['src'].value
      open('http:' + img) do |f|
        File.open(TEMP_IMAGE, 'wb') do |file|
          file.puts f.read
        end
      end
      Faraday::UploadIO.new(TEMP_IMAGE, 'image/png')
    end
  end
end
