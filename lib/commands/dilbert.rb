require_relative 'base'

module Commands
  class Dilbert < Base
    BASE_URL = 'https://dilbert.com'.freeze
    NAME = '/dilbert'.freeze
    TEMP_IMAGE = 'random-dilbert.gif'.freeze

    def execute(_message)
      random_date = Time.at(rand(Time.parse('1989-4-16').to_i..Time.now.to_i))
      random_date_str = random_date.strftime('%Y-%-m-%-d')

      doc = Nokogiri::HTML(HTTP.get("#{BASE_URL}/strip/#{random_date_str}").body.to_s)
      img = doc.css('.img-comic-container img').first.attributes['src'].value
      store_file(img, TEMP_IMAGE)

      {
        value: Faraday::UploadIO.new(TEMP_IMAGE, 'image/gif'),
        type: PHOTO
      }
    end
  end
end
