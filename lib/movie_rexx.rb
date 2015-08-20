require "movie_rexx/version"
require "movie_rexx/configuration"
require "movie_rexx/client"

module MovieRexx
  class << self
    include MovieRexx::Configuration

    # Alias for MovieRexx::Client.new
    # @return [MovieRexx::Client]
    def new(options = {})
      MovieRexx::Client.new(options)
    end
  end
end
