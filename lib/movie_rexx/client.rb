# Core
require 'movie_rexx/error'
require 'movie_rexx/connection'
require 'movie_rexx/default'
require 'movie_rexx/request'
# Client
require 'movie_rexx/client/movie'
require 'movie_rexx/client/certification'
require 'movie_rexx/client/changes'
require 'movie_rexx/client/collection'
require 'movie_rexx/client/company'

module MovieRexx
  class Client
    # Core
    include MovieRexx::Connection
    include MovieRexx::Default
    include MovieRexx::Request
    # Client
    include MovieRexx::Client::Movie
    include MovieRexx::Client::Certification
    include MovieRexx::Client::Changes
    include MovieRexx::Client::Collection
    include MovieRexx::Client::Company

    def initialize(options = {})
      MovieRexx::Configuration.keys.each do |key|
        instance_variable_set(
          :"@#{key}", options[key] ||
          MovieRexx.instance_variable_get(:"@#{key}")
        )
      end

      raise MovieRexx::MissingAPIKeyError if @api_key.nil? || @api_key.empty?
    end
  end
end
