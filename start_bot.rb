require_relative 'alebian_bot'
require 'logger'

logger = Logger.new(STDOUT)
logger.level = Logger::WARN

token = nil
token_path = File.expand_path("./.telegram_bot_token")
if File.exists?(token_path)
  token = File.read(token_path).strip
else
  raise LoadError,
        "Could not load the Telegram Bot Token, store it in a file called '.telegram_bot_token'"
end

bot = AlebianBot.new(token, logger)
bot.run
