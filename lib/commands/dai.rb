require_relative 'base'

module Commands
  class Dai < Base
    NAME = '/dai'.freeze
    KEY = 'dai'.freeze
    PRICE_KEY = 'price'.freeze

    def initialize(logger)
      super
      @client = Redis.new
    end

    def execute(message)
      command, price = message.text.split(' ')

      db = @client.get(KEY)
      db = db.blank? ? {} : Oj.load(db)
      db[message.chat.id.to_s] = {
        PRICE_KEY => price
      }
      @client.set(KEY, db.to_json)

      {
        value: "Registered alert for price: $#{price}",
        type: Types::TEXT
      }
    end
  end
end
