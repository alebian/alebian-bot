require_relative 'base'

module Commands
  class Xkcd < Base
    BASE_URL = 'https://xkcd.com'.freeze
    NAME = '/xkcd'.freeze
    TEMP_IMAGE = 'random-xkcd.png'.freeze

    def execute(_message)
      response = HTTP.get("#{BASE_URL}/info.0.json")
      json = Oj.load(response.body)
      total = json['num']
      random = rand(total)

      response = HTTP.get("#{BASE_URL}/#{random}/info.0.json")
      json = Oj.load(response.body)
      store_file(json['img'], TEMP_IMAGE)

      {
        value: Faraday::UploadIO.new(TEMP_IMAGE, 'image/png'),
        type: Types::PHOTO
      }
    end
  end
end
