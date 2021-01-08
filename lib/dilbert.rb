require_relative 'helpers'

module Dilbert
  module_function

  BASE_URL = 'https://dilbert.com'.freeze
  TEMP_IMAGE = 'random-dilbert.gif'.freeze

  def random_strip
    random_date = Time.at(rand(Time.parse('1989-4-16').to_i..Time.now.to_i))
    random_date_str = random_date.strftime('%Y-%-m-%-d')

    doc = Nokogiri::HTML(HTTP.get("#{BASE_URL}/strip/#{random_date_str}").body.to_s)
    img = doc.css('.img-comic-container img').first.attributes['src'].value
    Helpers.store_file(img, TEMP_IMAGE)

    Faraday::UploadIO.new(TEMP_IMAGE, 'image/gif')
  end
end
