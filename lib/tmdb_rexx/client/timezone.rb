module TmdbRexx
  class Client
    module Timezone
      RESOURCE = "timezones".freeze

      # Get the list of supported timezones for the API
      # methods that support them.
      #
      # @see
      # http://docs.themoviedb.apiary.io/#reference/movies/timezones
      #
      # @return [Hashie::Mash] response
      #
      # @example Get the timezones api response
      #   client.timezones
      def timezones(options = {})
        get([RESOURCE, "list"].join("/"), options)
      end
    end
  end
end
