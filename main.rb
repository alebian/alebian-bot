require_relative 'alebian_bot'
require 'logger'

logger = Logger.new(STDOUT)
token = nil

begin
  token_path = File.expand_path("./.telegram_bot_token")
  token = File.read(token_path).strip
rescue
  logger.error("Could not load the Telegram Bot Token, store it in a file called '.telegram_bot_token'")
  return
end

bot = AlebianBot.new(token, logger)
logger.info('Starting bot...')
bot.run
