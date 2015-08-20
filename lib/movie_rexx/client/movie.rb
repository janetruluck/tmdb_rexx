module MovieRexx
  class Client
    module Movie
      RESOURCE = "movie".freeze

      # Get the basic movie information for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieid
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie api response
      #   MovieRexx::Client.movie("movie-id")
      def movie(movie_id, options = {})
        get([RESOURCE, movie_id].join("/"), options)
      end

      # Get the alternative titles for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidalternativetitles
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie alternative titles api response
      #   MovieRexx::Client.movie_alternative_titles("movie-id")
      def movie_alternative_titles(movie_id, options = {})
        get([RESOURCE, movie_id, "alternative_titles"].join("/"), options)
      end

      # Get the cast and crew information for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/moviecredits
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie credits api response
      #   MovieRexx::Client.movie_credits("movie-id")
      def movie_credits(movie_id, options = {})
        get([RESOURCE, movie_id, "credits"].join("/"), options)
      end

      # Get the images (posters and backdrops) for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieimages
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie images api response
      #   MovieRexx::Client.movie_images("movie-id")
      def movie_images(movie_id, options = {})
        get([RESOURCE, movie_id, "images"].join("/"), options)
      end

      # Get the backdrops for a specific movie id.
      # This is a convenience method base on .movie_images
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie backdrops
      #   MovieRexx::Client.movie_backdrops("movie-id")
      def movie_backdrops(movie_id, options = {})
        get([RESOURCE, movie_id, "images"].join("/"), options).backdrops
      end

      # Get the posters for a specific movie id.
      # This is a convenience method base on .movie_images
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie posters
      #   MovieRexx::Client.movie_posters("movie-id")
      def movie_posters(movie_id, options = {})
        get([RESOURCE, movie_id, "images"].join("/"), options).posters
      end

      # Get the plot keywords for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidkeywords
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie keywords
      #   MovieRexx::Client.movie_keywords("movie-id")
      def movie_keywords(movie_id, options = {})
        get([RESOURCE, movie_id, "keywords"].join("/"), options)
      end

      # Get the release date and certification information by country for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidreleases
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie releases
      #   MovieRexx::Client.movie_releases("movie-id")
      def movie_releases(movie_id, options = {})
        get([RESOURCE, movie_id, "releases"].join("/"), options)
      end

      # Get the videos (trailers, teasers, clips, etc...) for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidvideos
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie videos
      #   MovieRexx::Client.movie_videos("movie-id")
      def movie_videos(movie_id, options = {})
        get([RESOURCE, movie_id, "videos"].join("/"), options)
      end

      # Get the translations for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidtranslations
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie translations
      #   MovieRexx::Client.movie_translations("movie-id")
      def movie_translations(movie_id, options = {})
        get([RESOURCE, movie_id, "translations"].join("/"), options)
      end

      # Get the similar movies for a specific movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidsimilar
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the similar movies
      #   MovieRexx::Client.similar_movies("movie-id")
      def similar_movies(movie_id, options = {})
        get([RESOURCE, movie_id, "similar"].join("/"), options)
      end

      # Get the reviews for a particular movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidreviews
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie reviews
      #   MovieRexx::Client.movie_reviews("movie-id")
      def movie_reviews(movie_id, options = {})
        get([RESOURCE, movie_id, "reviews"].join("/"), options)
      end

      # Get the lists that the movie belongs to.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidlists
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie lists
      #   MovieRexx::Client.movie_lists("movie-id")
      def movie_lists(movie_id, options = {})
        get([RESOURCE, movie_id, "lists"].join("/"), options)
      end

      # Get the changes made to the movie.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidchanges
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie changes
      #   MovieRexx::Client.movie_changes("movie-id")
      def movie_changes(movie_id, options = {})
        get([RESOURCE, movie_id, "changes"].join("/"), options)
      end

      # Get the latest movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidlatest
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movie latest
      #   MovieRexx::Client.latest_movie("movie-id")
      def latest_movie(movie_id, options = {})
        get([RESOURCE, "latest"].join("/"), options)
      end

      # Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidnow_playing
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movies now_playing
      #   MovieRexx::Client.now_playing("movie-id")
      def now_playing(movie_id, options = {})
        get([RESOURCE, "now_playing"].join("/"), options)
      end

      # Get the list of popular movies on The Movie Database. This list refreshes every day.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidpopular
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movies popular_movies
      #   MovieRexx::Client.popular_movies("movie-id")
      def popular_movies(movie_id, options = {})
        get([RESOURCE, "popular"].join("/"), options)
      end

      # Get the list of top_rated movies on The Movie Database. This list refreshes every day.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidtoprated
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movies top rated
      #   MovieRexx::Client.top_rated_movies("movie-id")
      def top_rated_movies(movie_id, options = {})
        get([RESOURCE, "top_rated"].join("/"), options)
      end

      # Get the list of movies playing that have been, or are being released this week. This list refreshes every day.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/movies/movieidupcoming
      #
      # @param [String] id the movie id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the movies upcoming
      #   MovieRexx::Client.upcoming("movie-id")
      def upcoming(movie_id, options = {})
        get([RESOURCE, "upcoming"].join("/"), options)
      end
    end
  end
end
