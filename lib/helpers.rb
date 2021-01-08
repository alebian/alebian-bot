class Helpers
  module_function

  def store_file(url, path)
    response = HTTP.get(url)

    File.open(path, 'wb') do |file|
      file.puts(response.body.to_s)
    end
  end
end
