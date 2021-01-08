require 'active_support/all'
require 'telegram/bot'
require 'oj'
require 'http'
require 'faker'
require 'sentimental'
require 'emoji'

Oj.optimize_rails

require_relative 'lib/alan_perlis'
require_relative 'lib/chuck_norris'
require_relative 'lib/xkcd'
require_relative 'lib/dilbert'

class AlebianBot
  DEFAULT_MESSAGE = 'Unknown command. '.freeze
  HELP_MESSAGE = 'Available commands: /help, /chuck, /perlis, /star, /xkcd, /dilbert'.freeze

  def initialize(token, logger)
    @token = token
    @logger = logger
    @analyzer = Sentimental.new
    @analyzer.load_defaults
  end

  def run
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        command = message.text.split(' ').first
        case command
        when '/help'
          send_message(bot, message, HELP_MESSAGE)
        when '/chuck'
          send_message(bot, message, ChuckNorris.random_quote)
        when '/perlis'
          send_message(bot, message, AlanPerlis.random_quote)
        when '/star'
          send_message(bot, message, Faker::Movies::StarWars.quote)
        when '/xkcd'
          send_photo(bot, message, Xkcd.random_comic)
        when '/dilbert'
          send_photo(bot, message, Dilbert.random_strip)
        else
          response = analyze_message(message.text)
          send_message(bot, message, response)
        end
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
    bot.api.send_message message_hash(message, text)
  end

  def message_hash(message, text)
    { chat_id: message.chat.id, text: text }
  end

  def send_photo(bot, message, photo)
    bot.api.send_photo photo_hash(message, photo)
  end

  def photo_hash(message, photo)
    { chat_id: message.chat.id, photo: photo }
  end
end
