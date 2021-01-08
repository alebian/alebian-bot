module Commands
  class Base
    TEXT = :text
    PHOTO = :photo

    def initialize(logger)
      @logger = logger
    end

    def responds?(message)
      message.start_with?(self.class::NAME)
    end

    def call(message)
      @logger.info("Executing command #{name}")

      execute(message)
    end

    def name
      self.class.to_s
    end

    def execute(message)
      raise 'Subclass must implement'
    end

    private

    def store_file(url, path)
      response = HTTP.get(url)

      File.open(path, 'wb') do |file|
        file.puts(response.body.to_s)
      end
    end
  end
end
