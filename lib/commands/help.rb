require_relative 'base'

module Commands
  class Help < Base
    NAME = '/help'.freeze

    def execute(_message)
      {
        value: 'Available commands: /help, /dai, /chuck, /perlis, /star, /xkcd, /dilbert',
        type: Types::TEXT
      }
    end
  end
end
