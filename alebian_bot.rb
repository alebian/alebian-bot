require 'telegram/bot'
require_relative 'lib/alan_perlis'
require_relative 'lib/chuck_norris'

class AlebianBot
  HELP_MESSAGE = 'Available commands: /help, /chuck, /perlis'.freeze

  class << self
    def run(token)
      Telegram::Bot::Client.run(token) do |bot|
        bot.listen do |message|
          case message.text
          when '/help'
            bot.api.send_message message_hash(message, HELP_MESSAGE)
          when '/chuck'
            bot.api.send_message message_hash(message, ChuckNorris.random_quote)
          when '/perlis'
            bot.api.send_message message_hash(message, AlanPerlis.random_quote)
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
end
