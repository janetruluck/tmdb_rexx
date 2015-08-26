
module TmdbRexx
  class Client
    module Genre
      RESOURCE = "genre".freeze
      POSSIBLE_TYPES = ["movie", "tv"].freeze

      # Get the list of movie or tv genres.
      #
      # @see # http://docs.themoviedb.apiary.io/#reference/movies/genres
      #
      # @param [String] type the resource type you want genres for
      #
      # @return [Hashie::Mash] response
      #
      # @example Get the movie genres api response
      #   client.genres("movie")
      def genres(type = "movie", options = {})
        raise InvalidTypeError unless POSSIBLE_TYPES.include?(type)
        get([RESOURCE, type, "list"].join("/"), options).genres
      end

      # Get the list of movies for a particular genre by id. By default, only
      # movies with 10 or more votes are included.
      #
      # @see # http://docs.themoviedb.apiary.io/#reference/movies/genremovielist
      #
      # @param [String] genre_id the if of the genre to get movies for
      #
      # @return [Hashie::Mash] response
      #
      # @example Get the movies for the genre api response
      #   client.genre_movies("genre-id")
      def genre_movies(genre_id, options = {})
        get([RESOURCE, genre_id, "movies"].join("/"), options)
      end
    end
  end
end
