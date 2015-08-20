module MovieRexx
  class Client
    module Certification
      RESOURCE = "certification".freeze

      # Get the list of supported certifications for movies. These can be used
      # in conjunction with the certification_country and certification.lte
      # parameters when using discover.
      #
      # @see
      # http://docs.themoviedb.apiary.io/#reference/movies/certificationmovielist
      #
      # @param [String] type the resource type you want certifications for
      #
      # @return [Hashie::Mash] response
      #
      # @example Get the movie certifications api response
      #   client.certifications("movies")
      def certifications(type = "movie", options = {})
        get([RESOURCE, type, "list"].join("/"), options).certifications
      end
    end
  end
end
