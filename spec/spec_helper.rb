ENV['RACK_ENV'] ||= 'test'
require 'byebug'
require 'redis'

require_relative '../lib/boot'

RSpec.configure do |config|
  config.order = :random
  Kernel.srand config.seed
end

ChatMock = Struct.new(:id)
MessageMock = Struct.new(:text, :chat)
