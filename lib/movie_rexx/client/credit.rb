module MovieRexx
  class Client
    module Credit
      RESOURCE = "credit".freeze

      # Get the detailed information about a particular credit record. This is
      # currently only supported with the new credit model found in TV. These
      # ids can be found from any TV credit response as well as the tv_credits
      # and combined_credits methods for people.The episodes object returns a
      # list of episodes and are generally going to be guest stars. The season
      # array will return a list of season numbers. Season credits are credits
      # that were marked with the "add to every season" option in the editing
      # interface and are assumed to be "season regulars".#
      #
      # @see http://docs.themoviedb.apiary.io/#reference/credits
      #
      # @param [String] credit_id the id for the credits
      #
      # @return [Hashie::Mash] credits response
      #
      # @example Get the credits api response
      #   MovieRexx::Client.credits("movie")
      def credits(credit_id, options = {})
        get([RESOURCE, credit_id].join("/"), options)
      end
    end
  end
end
