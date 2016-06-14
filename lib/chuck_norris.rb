require 'net/http'
require 'json'

class ChuckNorris
  BASE_URL = 'http://api.icndb.com'

  class << self
    def random_quote
      uri = URI("#{BASE_URL}/jokes/random")
      response = Net::HTTP.get(uri)
      json = JSON.parse(response)
      return 'An error has ocurred' unless json['type'] == 'success'
      json['value']['joke']
    end

    def random_quotes(number)
      uri = URI("#{BASE_URL}/jokes/random/#{number.to_i}")
      response = Net::HTTP.get(uri)
      json = JSON.parse(response)
      return 'An error has ocurred' unless json['type'] == 'success'
      json['value'].each_with_object([]) do |joke, array|
        array << joke['joke']
        array
      end.join(' | ')
    end
  end
end
