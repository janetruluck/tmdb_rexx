module TmdbRexx
  class Client
    module Changes
      RESOURCE = "changes".freeze
      POSSIBLE_TYPES = ["movie", "person", "tv"].freeze

      # Get a list of movie ids that have been edited. By default we
      # show the last 24 hours and only 100 items per page. The
      # maximum number of days that can be returned in a single
      # request is 14. You can then use the movie changes API to get
      # the actual data that has been changed.
      #
      # Please note: the change log system to support this was
      # changed on October 5, 2012 and will only show movies that
      # have been edited since.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/changes
      #
      # @param [String] type the type of resource to get changes
      # for. Available options include `movie`, `person`, and `tv`
      #
      # @return [Hashie::Mash] changes response
      #
      # @example Get the movie changes api response
      #   TmdbRexx::Client.changes("movie")
      def changes(type = "movie", options = {})
        raise InvalidTypeError unless POSSIBLE_TYPES.include?(type)
        get([type, RESOURCE].join("/"), options)
      end
    end
  end
end
