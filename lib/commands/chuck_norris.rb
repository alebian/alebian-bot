require_relative 'base'

module Commands
  class ChuckNorris < Base
    BASE_URL = 'http://api.icndb.com'.freeze
    NAME = '/chuck'.freeze

    def execute(_message)
      response = HTTP.get("#{BASE_URL}/jokes/random")
      json = Oj.load(response.body)

      {
        value: json.dig('value', 'joke'),
        type: TEXT
      }
    end
  end
end
