class Helpers
  module_function

  def store_file(url, path)
    open(url) do |f|
      File.open(path, 'wb') do |file|
        file.puts(f.read)
      end
    end
  end
end
