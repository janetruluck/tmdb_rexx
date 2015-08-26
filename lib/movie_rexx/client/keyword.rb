module MovieRexx
  class Client
    module Keyword
      RESOURCE = "keyword".freeze

      # Get the basic information for a specific keyword id.
      #
      # @see # http://docs.themoviedb.apiary.io/#reference/movies/keywordid
      #
      # @param [String] keyword_id the id of the keyword to get information about
      #
      # @return [Hashie::Mash] response
      #
      # @example Get the keyword api response
      #   client.keyword("keyword-id")
      def keyword(keyword_id, options = {})
        get([RESOURCE, keyword_id].join("/"), options)
      end

      # Get the list of movies for a particular keyword by id.
      #
      # @see # http://docs.themoviedb.apiary.io/#reference/movies/keywordidmovies
      #
      # @param [String] keyword_id the id of the keyword to get information about
      #
      # @return [Hashie::Mash] response
      #
      # @example Get the movies for the keyword api response
      #   client.keyword_movies("keyword-id")
      def keyword_movies(keyword_id, options = {})
        get([RESOURCE, keyword_id, "movies"].join("/"), options)
      end
    end
  end
end
