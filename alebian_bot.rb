require 'telegram/bot'
require_relative 'lib/alan_perlis'
require_relative 'lib/chuck_norris'
require 'faker'
require 'sentimental'
require 'byebug'

class AlebianBot
  DEFAULT_MESSAGE = 'Unknown command. '.freeze
  HELP_MESSAGE = 'Available commands: /help, /chuck, /perlis'.freeze

  def initialize(token, logger)
    @token = token
    @logger = logger
  end

  def run
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message.text
        when '/help'
          bot.api.send_message message_hash(message, HELP_MESSAGE)
        when '/chuck'
          bot.api.send_message message_hash(message, ChuckNorris.random_quote)
        when '/perlis'
          bot.api.send_message message_hash(message, AlanPerlis.random_quote)
        else
          bot.api.send_message message_hash(message, DEFAULT_MESSAGE + HELP_MESSAGE)
        end
      end
    end
  end

  private

  def message_hash(message, text)
    {
      chat_id: message.chat.id,
      text: text
    }
  end
end
