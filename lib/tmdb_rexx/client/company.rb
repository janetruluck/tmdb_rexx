module TmdbRexx
  class Client
    module Company
      RESOURCE = "company".freeze


      # This method is used to retrieve all of the basic information about a company.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/companyid
      #
      # @param [String] company_id the id of the company
      #
      # @return [Hashie::Mash] companyies response
      #
      # @example Get the companys api response
      #   TmdbRexx::Client.company("company-id")
      def company(company_id, options = {})
        get([RESOURCE, company_id].join("/"), options)
      end


      # Get the list of movies associated with a particular company.
      #
      # @see http://docs.themoviedb.apiary.io/#reference/companyidmovies
      #
      # @param [String] company_id the id of the company
      #
      # @return [Hashie::Mash] companies response
      #
      # @example Get the movies for the company api response
      #   TmdbRexx::Client.company_movies("company-id")
      def company_movies(company_id, options = {})
        get([RESOURCE, company_id, "movies"].join("/"), options)
      end
    end
  end
end
