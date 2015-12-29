module TmdbRexx
  class Client
    module TvSeasons
      PARENT_RESOURCE = "tv".freeze
      RESOURCE = "season".freeze

      # Get the primary information about a TV season by its season number.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv-seasons
      #
      # @param [String] id the tv id
      # @param [Integer] season_number the season number of the tv show
      #
      # @example Get the tv seasons api response
      #   TmdbRexx::Client.tv_seasons("tv-id", "season-number')
      def tv_season(tv_id, season_number, options = {})
        get([PARENT_RESOURCE, tv_id, RESOURCE, season_number].join("/"), options)
      end

      # Look up a TV season's changes by season ID. This method is used in
      # conjunction with the /tv/{id}/changes method. This method uses the
      # season_id value found in the change entries.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv-seasons/tvseasonidchanges
      #
      # @param [String] season_id the tv season id
      #
      # @example Get the tv seasons changs api response
      #   TmdbRexx::Client.tv_season_changes("tv-id", "season-number')
      def tv_season_changes(season_id, options = {})
        get([PARENT_RESOURCE, RESOURCE, season_id, "changes"].join("/"), options)
      end

      # This method lets users get the status of whether or not the TV episodes
      # of a season have been rated. A valid session id is required.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv-seasons/tvidseasonseasonnumberaccountstates
      #
      # @param [String] id the tv id
      # @param [Integer] season_number the season number of the tv show
      #
      # @example Get the tv seasons account states api response
      #   TmdbRexx::Client.tv_seasons_account_states("tv-id", "season-number')
      def tv_season_account_states(tv_id, season_number, options = {})
        get([PARENT_RESOURCE, tv_id, RESOURCE, season_number, "account_states"].join("/"), options)
      end

      # Get the cast & crew credits for a TV season by season number.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv-seasons/tvidseasonseasonnumbercredits
      #
      # @param [String] id the tv id
      # @param [Integer] season_number the season number of the tv show
      #
      # @example Get the tv seasons credits api response
      #   TmdbRexx::Client.tv_seasons_credits("tv-id", "season-number')
      def tv_season_credits(tv_id, season_number, options = {})
        get([PARENT_RESOURCE, tv_id, RESOURCE, season_number, "credits"].join("/"), options)
      end

      # Get the external ids that we have stored for a TV season by season number.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv-seasons/tvidseasonseasonnumberexternalids
      #
      # @param [String] id the tv id
      # @param [Integer] season_number the season number of the tv show
      #
      # @example Get the tv seasons external_ids api response
      #   TmdbRexx::Client.tv_seasons_external_ids("tv-id", "season-number')
      def tv_season_external_ids(tv_id, season_number, options = {})
        get([PARENT_RESOURCE, tv_id, RESOURCE, season_number, "external_ids"].join("/"), options)
      end

      # Get the images (posters) that we have stored for a TV season by season number.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv-seasons/tvidseasonseasonnumberimages
      #
      # @param [String] id the tv id
      # @param [Integer] season_number the season number of the tv show
      #
      # @example Get the tv seasons images api response
      #   TmdbRexx::Client.tv_seasons_images("tv-id", "season-number')
      def tv_season_images(tv_id, season_number, options = {})
        get([PARENT_RESOURCE, tv_id, RESOURCE, season_number, "images"].join("/"), options)
      end

      # Get the videos that have been added to a TV season (trailers, teasers, etc...)
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv-seasons/tvidseasonseasonnumbervideos
      #
      # @param [String] id the tv id
      # @param [Integer] season_number the season number of the tv show
      #
      # @example Get the tv seasons videos api response
      #   TmdbRexx::Client.tv_seasons_videos("tv-id", "season-number')
      def tv_season_videos(tv_id, season_number, options = {})
        get([PARENT_RESOURCE, tv_id, RESOURCE, season_number, "videos"].join("/"), options)
      end
    end
  end
end
