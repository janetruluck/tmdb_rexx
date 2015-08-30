module TmdbRexx
  class Client
    module Search
      RESOURCE = "search".freeze
      POSSIBLE_TYPES = %w(company collection keyword list movie multi person tv).freeze

      # Search the tmdb database for the specified type
      #
      # @see http://docs.themoviedb.apiary.io/#reference/search
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchcompany
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchcollection
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchkeyword
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchlist
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchmovie
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchmulti
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchperson
      # @see http://docs.themoviedb.apiary.io/#reference/search/searchtv
      #
      # @param [String] type the type of resource to search.
      #   Possible types include:
      #   * company - Search for companies by name.
      #   * collection - Search for collections by name.
      #   * keyword - Search for keywords by name.
      #   * list - Search for lists by name and description.
      #   * movie - Search for movies by title.
      #   * multi - Search the movie, tv show and person collections with a single query. Each item returned in the result array has a media_type field that maps to either movie, tv or person.Each mapped result is the same response you would get from each independent search.
      #   * person - Search for people by name.
      #   * tv - Search for TV shows by title.
      #
      # @return [Hashie::Mash] changes response
      #
      # @example Get the movie search api response
      #   TmdbRexx::Client.search("movie", "some-query")
      def search(type, query, options = {})
        raise InvalidTypeError unless POSSIBLE_TYPES.include?(type)
        options.merge!(query: query)
        get([RESOURCE, type].join("/"), options)
      end
    end
  end
end
