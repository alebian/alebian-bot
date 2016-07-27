require 'open-uri'
require 'nokogiri'
require 'faraday'

class Dilbert
  BASE_URL = 'http://dilbert.com/'
  TEMP_IMAGE = 'random-dilbert.gif'.freeze

  class << self
    def random_strip
      random_date = Time.at(rand(Time.parse('1989-4-16').to_i..Time.now.to_i))
      random_date_str = random_date.strftime('%Y-%-m-%-d')
      doc = Nokogiri::HTML(open(BASE_URL + '/strip/' + random_date_str))
      img = doc.css('.img-comic-container img').first.attributes['src'].value
      open(img) do |f|
        File.open(TEMP_IMAGE, 'wb') do |file|
          file.puts f.read
        end
      end
      Faraday::UploadIO.new(TEMP_IMAGE, 'image/gif')
    end
  end
end
