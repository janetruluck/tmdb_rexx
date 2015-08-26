require "tmdb_rexx/version"
require "tmdb_rexx/configuration"
require "tmdb_rexx/client"

module TmdbRexx
  class << self
    include TmdbRexx::Configuration

    # Alias for TmdbRexx::Client.new
    # @return [TmdbRexx::Client]
    def new(options = {})
      TmdbRexx::Client.new(options)
    end
  end
end
