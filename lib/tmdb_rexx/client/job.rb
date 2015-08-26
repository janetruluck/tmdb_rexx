module TmdbRexx
  class Client
    module Job
      RESOURCE = "job".freeze

      # Get the list of valid jobs
      #
      # @see # http://docs.themoviedb.apiary.io/#reference/movies/joblist
      #
      # @return [Hashie::Mash] response
      #
      # @example Get the jobs api response
      #   client.jobs
      def jobs(options = {})
        get([RESOURCE, "list"].join("/"), options).jobs
      end
    end
  end
end
