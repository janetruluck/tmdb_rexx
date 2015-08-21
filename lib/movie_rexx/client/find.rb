module MovieRexx
  class Client
    module Find
      RESOURCE = "find".freeze
      EXTERNAL_SOURCES = ["imdb_id", "freebase_mid", "freebase_id",
                          "tvrage_id", "tvdb_id"].freeze

      # The find method makes it easy to search for objects in our database by
      # an external id. For instance, an IMDB ID. This will search all objects
      # (movies, TV shows and people) and return the results in a single
      # response.The supported external sources for each object are as
      # follows:
      #
      # * Movies: imdb_id
      # * People: imdb_id, freebase_mid, freebase_id, tvrage_id
      # * TV Series: imdb_id, freebase_mid, freebase_id, tvdb_id, tvrage_id
      # * TV Seasons: freebase_mid, freebase_id, tvdb_id, tvrage_id
      # * TV Episodes: imdb_id, freebase_mid, freebase_id, tvdb_id, tvrage_id
      #
      # @see http://docs.themoviedb.apiary.io/#reference/find
      #
      # @param [String] external_id the id in the external source
      # @param [String] external_source the the external source to query
      #
      # @return [Hashie::Mash] find response
      #
      # @example Get the find api response
      #   MovieRexx::Client.find("external-id", "external-source")
      def find(external_id, external_source = "imdb_id", options = {})
        raise InvalidExternalSourceError unless EXTERNAL_SOURCES.include?(external_source)
        options.merge!(external_source: external_source)
        get([RESOURCE, external_id].join("/"), options)
      end
    end
  end
end
