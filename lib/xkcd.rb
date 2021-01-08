require_relative 'helpers'

module Xkcd
  module_function

  BASE_URL = 'https://xkcd.com'.freeze
  TEMP_IMAGE = 'random-xkcd.png'.freeze

  def random_comic
    response = HTTP.get("#{BASE_URL}/info.0.json")
    json = Oj.load(response.body)
    total = json['num']
    random = rand(total)

    response = HTTP.get("#{BASE_URL}/#{random}/info.0.json")
    json = Oj.load(response.body)
    Helpers.store_file(json['img'], TEMP_IMAGE)

    Faraday::UploadIO.new(TEMP_IMAGE, 'image/png')
  end
end
