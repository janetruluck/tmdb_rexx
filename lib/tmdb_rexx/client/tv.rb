module TmdbRexx
  class Client
    module Tv
      RESOURCE = "tv".freeze

      # Get the primary information about a TV series by id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tvs/tvid
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv api response
      #   TmdbRexx::Client.tv("tv-id")
      def tv(tv_id, options = {})
        get([RESOURCE, tv_id].join("/"), options)
      end

      # Get the alternative titles for a specific show ID.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidalternativetitles
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv alternative titles api response
      #   TmdbRexx::Client.tv_alternative_titles("tv-id")
      def tv_alternative_titles(tv_id, options = {})
        get([RESOURCE, tv_id, "alternative_titles"].join("/"), options)
      end

      # Get the changes for a specific TV show id.Changes are grouped by key,
      # and ordered by date in descending order. By default, only the last 24
      # hours of changes are returned. The maximum number of days that can be
      # returned in a single request is 14. The language is present on fields
      # that are translatable.TV changes are different than movie changes in
      # that there are some edits on seasons and episodes that will create a
      # change entry at the show level. They can be found under the season and
      # episode keys. These keys will contain a series_id and episode_id. You
      # can use the /tv/season/{id}/changes and /tv/episode/{id}/changes
      # methods to look up these specific changes.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidchanges
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv changes
      #   TmdbRexx::Client.tv_changes("tv-id")
      def tv_changes(tv_id, options = {})
        get([RESOURCE, tv_id, "changes"].join("/"), options)
      end

      # Get the content ratings for a specific TV show id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidcontentratings
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv content_ratings
      #   TmdbRexx::Client.tv_content_ratings("tv-id")
      def tv_content_ratings(tv_id, options = {})
        get([RESOURCE, tv_id, "content_ratings"].join("/"), options)
      end

      # Get the cast & crew information about a TV series. Just like the
      # website, we pull this information from the last season of the series.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidcredits
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv credits api response
      #   TmdbRexx::Client.tv_credits("tv-id")
      def tv_credits(tv_id, options = {})
        get([RESOURCE, tv_id, "credits"].join("/"), options)
      end

      # Get the external ids that we have stored for a TV series.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidexternalids
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv external_ids api response
      #   TmdbRexx::Client.tv_external_ids("tv-id")
      def tv_external_ids(tv_id, options = {})
        get([RESOURCE, tv_id, "external_ids"].join("/"), options)
      end

      # Get the images (posters and backdrops) for a specific tv id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvimages
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv images api response
      #   TmdbRexx::Client.tv_images("tv-id")
      def tv_images(tv_id, options = {})
        get([RESOURCE, tv_id, "images"].join("/"), options)
      end

      # Get the backdrops for a specific tv id.
      # This is a convenience method base on .tv_images
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv backdrops
      #   TmdbRexx::Client.tv_backdrops("tv-id")
      def tv_backdrops(tv_id, options = {})
        get([RESOURCE, tv_id, "images"].join("/"), options)["backdrops"]
      end

      # Get the posters for a specific tv id.
      # This is a convenience method base on .tv_images
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv posters
      #   TmdbRexx::Client.tv_posters("tv-id")
      def tv_posters(tv_id, options = {})
        get([RESOURCE, tv_id, "images"].join("/"), options)["posters"]
      end

      # Get the plot keywords for a specific tv id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidkeywords
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv keywords
      #   TmdbRexx::Client.tv_keywords("tv-id")
      def tv_keywords(tv_id, options = {})
        get([RESOURCE, tv_id, "keywords"].join("/"), options)
      end

      # Get the translations for a specific tv id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidtranslations
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv translations
      #   TmdbRexx::Client.tv_translations("tv-id")
      def tv_translations(tv_id, options = {})
        get([RESOURCE, tv_id, "translations"].join("/"), options)
      end

      # Get the similar shows for a specific tv id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidsimilar
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the similar tvs
      #   TmdbRexx::Client.similar_tvs("tv-id")
      def similar_tvs(tv_id, options = {})
        get([RESOURCE, tv_id, "similar"].join("/"), options)
      end

      # Get the videos (trailers, teasers, clips, etc...) for a specific tv id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tv/tvidvideos
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv videos
      #   TmdbRexx::Client.tv_videos("tv-id")
      def tv_videos(tv_id, options = {})
        get([RESOURCE, tv_id, "videos"].join("/"), options)
      end

      # Get the list of TV shows that are currently on the air. This query
      # looks for any TV show that has an episode with an air date in the next
      # 7 days.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tvs/tvidon_the_air
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv on_the_air
      #   TmdbRexx::Client.on_the_air_tv("tv-id")
      def on_the_air_tv(tv_id, options = {})
        get([RESOURCE, "on_the_air"].join("/"), options)
      end

      # Get the list of TV shows that air today. Without a specified timezone,
      # this query defaults to EST (Eastern Time UTC-05:00).
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tvs/tvidairing_today
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv airing_today
      #   TmdbRexx::Client.airing_today_tv("tv-id")
      def airing_today_tv(tv_id, options = {})
        get([RESOURCE, "airing_today"].join("/"), options)
      end

      # Get the latest tv id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tvs/tvidlatest
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tv latest
      #   TmdbRexx::Client.latest_tv("tv-id")
      def latest_tv(tv_id, options = {})
        get([RESOURCE, "latest"].join("/"), options)
      end

      # Get the list of top rated TV shows. By default, this list will only
      # include TV shows that have 2 or more votes. This list refreshes every
      # day.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tvs/tvidtoprated
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tvs top rated
      #   TmdbRexx::Client.top_rated_tvs("tv-id")
      def top_rated_tv(tv_id, options = {})
        get([RESOURCE, "top_rated"].join("/"), options)
      end

      # Get the list of popular tvs on The Movie Database. This list refreshes
      # every day.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/tvs/tvidpopular
      #
      # @param [String] id the tv id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the tvs popular_tvs
      #   TmdbRexx::Client.popular_tvs("tv-id")
      def popular_tv(tv_id, options = {})
        get([RESOURCE, "popular"].join("/"), options)
      end
    end
  end
end
