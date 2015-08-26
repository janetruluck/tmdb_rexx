module TmdbRexx
  class Client
    module Discover
      RESOURCE = "discover".freeze

      # Discover movies and tv shows by different types of data like average
      # rating, number of votes, genres and certifications. You can get a valid
      # list of certifications from the /certifications method.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/discover
      #
      # @param [String] type the type to discover for for the discover
      #
      # @return [Hashie::Mash] discover response
      #
      # @example Get the discover api response
      #   TmdbRexx::Client.discover("movie", { primary_release_year: 2015 })
      def discover(type = "movie", options = {})
        get([RESOURCE, type].join("/"), options)
      end
    end
  end
end
