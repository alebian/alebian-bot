module Workers
  class DaiTicker
    URL = 'https://be.buenbit.com/api/market/tickers/'.freeze

    def initialize(bot, logger)
      @bot = bot
      @logger = logger
      @client = Redis.new
    end

    def call
      while true do
        response = HTTP.get(URL)
        json = Oj.load(response.body)
        price = json.dig('object', 'daiars', 'selling_price').to_d

        @logger.info("DAI price: #{price}")

        (Oj.load(@client.get(Commands::Dai::KEY) || '{}')).each do |chat_id, options|
          alert_price = options[Commands::Dai::PRICE_KEY].to_d
          if price <= alert_price
            @logger.info("Sending price to #{chat_id}")
            @bot.api.send_message(
              chat_id: chat_id,
              text: "Price #{price.to_s} is below #{alert_price}!"
            )
          else
            @logger.debug("Not sending price to #{chat_id}")
          end
        end

        sleep(30)
      end
    end
  end
end
