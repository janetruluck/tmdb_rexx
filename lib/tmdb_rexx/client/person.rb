module TmdbRexx
  class Client
    module Person
      RESOURCE = "person".freeze

      # Get the general person information for a specific id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/person/personid
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person api response
      #   TmdbRexx::Client.person("person-id")
      def person(person_id, options = {})
        get([RESOURCE, person_id].join("/"), options)
      end

      # Get the movie credits for a specific person id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidmoviecredits
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person movie credits api response
      #   TmdbRexx::Client.person_movie_credits("person-id")
      def person_movie_credits(person_id, options = {})
        get([RESOURCE, person_id, "movie_credits"].join("/"), options)
      end

      # Get the TV credits for a specific person id.To get the expanded details
      # for each record, call the /credit method with the provided credit_id.
      # This will provide details about which episode and/or season the credit
      # is for.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidtvcredits
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person tv credits api response
      #   TmdbRexx::Client.person_tv_credits("person-id")
      def person_tv_credits(person_id, options = {})
        get([RESOURCE, person_id, "tv_credits"].join("/"), options)
      end

      # Get the combined (movie and TV) credits for a specific person id.To get
      # the expanded details for each TV record, call the /credit method with
      # the provided credit_id. This will provide details about which episode
      # and/or season the credit is for.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidcombinedcredits
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person combined credits api response
      #   TmdbRexx::Client.person_combined_credits("person-id")
      def person_combined_credits(person_id, options = {})
        get([RESOURCE, person_id, "combined_credits"].join("/"), options)
      end

      # Get the external ids for a specific person id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidexternalids
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person external ids api response
      #   TmdbRexx::Client.person_external_ids("person-id")
      def person_external_ids(person_id, options = {})
        get([RESOURCE, person_id, "external_ids"].join("/"), options)
      end

      # Get the images for a specific person id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidimages
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person images api response
      #   TmdbRexx::Client.person_images("person-id")
      def person_images(person_id, options = {})
        get([RESOURCE, person_id, "images"].join("/"), options)
      end

      # Get the images that have been tagged with a specific person id. We
      # return all of the image results with a media object mapped for each
      # image.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidtaggedimages
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person tagged images api response
      #   TmdbRexx::Client.tagged_images("person-id")
      def tagged_images(person_id, options = {})
        get([RESOURCE, person_id, "tagged_images"].join("/"), options)
      end

      # Get the person profile images for a specific person id.
      # This is a convenience method base on .person_images
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person profile images
      #   TmdbRexx::Client.person_profiles("person-id")
      def person_profiles(person_id, options = {})
        get([RESOURCE, person_id, "images"].join("/"), options).profiles
      end

      # Get the changes made to the movie.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidchanges
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person changes
      #   TmdbRexx::Client.person_changes("person-id")
      def person_changes(person_id, options = {})
        get([RESOURCE, person_id, "changes"].join("/"), options)
      end

      # Get the latest movie id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidlatest
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the person latest
      #   TmdbRexx::Client.latest_person("person-id")
      def latest_person(person_id, options = {})
        get([RESOURCE, "latest"].join("/"), options)
      end

      # Get the list of popular movies on The Movie Database. This list refreshes every day.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/people/personidpopular
      #
      # @param [String] id the person id
      #
      # @return [Hashie::Mash] person response
      #
      # @example Get the people popular_people
      #   TmdbRexx::Client.popular_people("person-id")
      def popular_people(person_id, options = {})
        get([RESOURCE, "popular"].join("/"), options)
      end
    end
  end
end
