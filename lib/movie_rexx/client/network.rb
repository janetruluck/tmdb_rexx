module MovieRexx
  class Client
    module Network
      RESOURCE = "network".freeze

      # This method is used to retrieve the basic information about a TV
      # network. You can use this ID to search for TV shows with the discover.
      # At this time we don't have much but this will be fleshed out over time.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/networks
      #
      # @param [String] id the network id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the network api response
      #   MovieRexx::Client.network("network-id")
      def network(network_id, options = {})
        get([RESOURCE, network_id].join("/"), options)
      end
    end
  end
end
