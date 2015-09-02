module TmdbRexx
  # Default configuration for {Client}
  module Default
    API_KEY = nil
    BASE_URL = "https://api.themoviedb.org".freeze
    VERSION = 3
    INCLUDE_ADULT = false
    LANGUAGE = "en".freeze

    # Default API endpoint built from the base url and version
    # @return [String]
    def api_endpoint
      "#{base_url}/#{version}"
    end

    # Default api_key key from ENV
    # @return [String]
    def api_key
      ENV['TMDB_REXX_API_KEY'] || @api_key
    end

    # Default API base_url from ENV or {API_BASE_URL}
    # @return [String]
    def base_url
      require "pry"
      ENV['TMDB_REXX_BASE_URL'] || @base_url || BASE_URL
    end

    # Default API version from ENV or {API_VERSION}
    # @return [String]
    def version
      ENV['TMDB_REXX_VERSION'] || @version || VERSION
    end

    # Default include_adult from ENV or {INCLUDE_ADULT}
    # @return [String]
    def include_adult
      ENV['TMDB_REXX_INCLUDE_ADULT'] || @include_adult || INCLUDE_ADULT
    end

    # Default language from ENV or {LANGUAGE}
    # @return [String]
    def language
      ENV['TMDB_REXX_LANGUAGE'] || @language || LANGUAGE
    end
  end
end
