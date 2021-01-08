require 'active_support/all'
require 'telegram/bot'
require 'oj'
require 'http'
require 'faker'
require 'sentimental'
require 'emoji'
require 'open-uri'
require 'nokogiri'
require 'faraday'

Oj.optimize_rails

require_relative 'lib/commands/alan_perlis'
require_relative 'lib/commands/chuck_norris'
require_relative 'lib/commands/dilbert'
require_relative 'lib/commands/help'
require_relative 'lib/commands/star_wars'
require_relative 'lib/commands/xkcd'

class AlebianBot
  def initialize(token, logger)
    @token = token
    @logger = logger
    @analyzer = Sentimental.new
    @analyzer.load_defaults

    @commands = [
      Commands::AlanPerlis.new(logger),
      Commands::ChuckNorris.new(logger),
      Commands::Dilbert.new(logger),
      Commands::Help.new(logger),
      Commands::StarWars.new(logger),
      Commands::Xkcd.new(logger)
    ]
  end

  def run
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        @logger.info("Message received: '#{message}'")

        @commands.each do |command|
          if commands.responds?(message.text)
            response = command.call(message.text)

            case response[:type]
            when Commands::TEXT
              send_message(bot, message, response[:value])
            when Commands::PHOTO
              send_photo(bot, message, response[:value])
            end

            return
          end
        end

        response = analyze_message(message.text)
        send_message(bot, message, response)

      rescue StandardError => e
        @logger.error(e.message)
        send_message(bot, message, "There was an error processing that command, sorry.")
      end
    end
  end

  private

  def analyze_message(text)
    sentiment = @analyzer.sentiment(text)
    case sentiment
    when :positive
      return "Thanks! \u{263A}"
    when :negative
      return "\u{1F628} Wow, so rude!"
    else
      return "I didn't understand you, try /help to see the available commands."
    end
  end

  def send_message(bot, message, text)
    bot.api.send_message(
      chat_id: message.chat.id,
      text: text
    )
  end

  def send_photo(bot, message, photo)
    bot.api.send_photo(
      chat_id: message.chat.id,
      photo: photo
    )
  end
end
