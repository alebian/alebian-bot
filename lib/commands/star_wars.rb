require_relative 'base'

module Commands
  class StarWars < Base
    NAME = '/star'.freeze

    def execute(_message)
      {
        value: Faker::Movies::StarWars.quote,
        type: TEXT
      }
    end
  end
end
