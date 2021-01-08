class ChuckNorris
  module_function

  BASE_URL = 'http://api.icndb.com'.freeze

  def random_quote
    response = HTTP.get("#{BASE_URL}/jokes/random")
    json = Oj.load(response.body)
    json.dig('value', 'joke')
  end
end
