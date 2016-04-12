require 'telegram/bot'
require_relative 'chuck_norris'

class AlebianBot
  def self.run(token)
    Telegram::Bot::Client.run(token) do |bot|
      bot.listen do |message|
        case message.text
        when '/chuck'
          bot.api.send_message(chat_id: message.chat.id, text: ChuckNorris.random_quote)
        end
      end
    end
  end
end
