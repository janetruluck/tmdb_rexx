module MovieRexx
  class Client
    module Collection
      RESOURCE = "collection".freeze

      # Get the basic collection information for a specific
      # collection id. You can get the ID needed for this method by
      # making a /movie/{id} request and paying attention to the
      # belongs_to_collection hash.Movie parts are not sorted in any
      # particular order. If you would like to sort them yourself you
      # can use the provided release_date.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/collections
      #
      # @param [String] collection_id the id of the collection
      #
      # @return [Hashie::Mash] collections response
      #
      # @example Get the collections api response
      #   MovieRexx::Client.collection("collection-id")
      def collection(collection_id, options = {})
        get([RESOURCE, collection_id].join("/"), options)
      end

      # Get all of the images for a particular collection by collection id.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/collectionidimages
      #
      # @param [String] collection_id the id of the collection
      #
      # @return [Hashie::Mash] collections response
      #
      # @example Get the images in the collections api response
      #   MovieRexx::Client.collection_images("collection-id")
      def collection_images(collection_id, options = {})
        get([RESOURCE, collection_id, "images"].join("/"), options)
      end
    end
  end
end
