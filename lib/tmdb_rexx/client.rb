# Core
require 'tmdb_rexx/error'
require 'tmdb_rexx/connection'
require 'tmdb_rexx/default'
require 'tmdb_rexx/request'
# Client
require 'tmdb_rexx/client/movie'
require 'tmdb_rexx/client/certification'
require 'tmdb_rexx/client/changes'
require 'tmdb_rexx/client/collection'
require 'tmdb_rexx/client/company'
require 'tmdb_rexx/client/credit'
require 'tmdb_rexx/client/discover'
require 'tmdb_rexx/client/find'
require 'tmdb_rexx/client/genre'
require 'tmdb_rexx/client/job'
require 'tmdb_rexx/client/keyword'
require 'tmdb_rexx/client/network'
require 'tmdb_rexx/client/review'
require 'tmdb_rexx/client/timezone'
require 'tmdb_rexx/client/person'
require 'tmdb_rexx/client/search'
require 'tmdb_rexx/client/tv'

module TmdbRexx
  class Client
    # Core
    include TmdbRexx::Connection
    include TmdbRexx::Default
    include TmdbRexx::Request
    # Client
    include TmdbRexx::Client::Movie
    include TmdbRexx::Client::Certification
    include TmdbRexx::Client::Changes
    include TmdbRexx::Client::Collection
    include TmdbRexx::Client::Company
    include TmdbRexx::Client::Credit
    include TmdbRexx::Client::Discover
    include TmdbRexx::Client::Find
    include TmdbRexx::Client::Genre
    include TmdbRexx::Client::Job
    include TmdbRexx::Client::Keyword
    include TmdbRexx::Client::Network
    include TmdbRexx::Client::Review
    include TmdbRexx::Client::Timezone
    include TmdbRexx::Client::Person
    include TmdbRexx::Client::Search
    include TmdbRexx::Client::Tv

    def initialize(options = {})
      TmdbRexx::Configuration.keys.each do |key|
        instance_variable_set(
          :"@#{key}", options[key] ||
          TmdbRexx.instance_variable_get(:"@#{key}")
        )
      end

      raise TmdbRexx::MissingAPIKeyError if @api_key.nil? || @api_key.empty?
    end
  end
end
