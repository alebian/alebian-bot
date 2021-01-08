require_relative 'base'

module Commands
  class Help < Base
    NAME = '/help'.freeze

    def execute(_message)
      {
        value: 'Available commands: /help, /chuck, /perlis, /star, /xkcd, /dilbert',
        type: TEXT
      }
    end
  end
end
