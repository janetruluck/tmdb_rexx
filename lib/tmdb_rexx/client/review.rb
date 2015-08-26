module TmdbRexx
  class Client
    module Review
      RESOURCE = "review".freeze

      # Get the full details of a review by ID.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/reviewid
      #
      # @param [String] id the review id
      #
      # @return [Hashie::Mash] build response
      #
      # @example Get the review api response
      #   TmdbRexx::Client.review("review-id")
      def review(review_id, options = {})
        get([RESOURCE, review_id].join("/"), options)
      end
    end
  end
end
