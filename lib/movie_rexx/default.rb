module MovieRexx
  # Default configuration for {Client}
  module Default
    BASE_URL = "https://api.themoviedb.org".freeze
    VERSION = 3
    INCLUDE_ADULT = false
    LANGUAGE = "en".freeze

    # Default API endpoint built from the base url and version
    # @return [String]
    def api_endpoint
      "#{@base_url}/#{@version}"
    end

    class << self
      # Configuration options
      # @return [Hash]
      def options
        Hash[MovieRexx::Configuration.keys.map{|key| [key, send(key)]}]
      end

      # Default api_key key from ENV
      # @return [String]
      def api_key
        ENV['MOVIEREXX_API_KEY'] || @api_key
      end

      # Default API base_url from ENV or {API_BASE_URL}
      # @return [String]
      def base_url
        ENV['MOVIEREXX_BASE_URL'] || @base_url || BASE_URL
      end

      # Default API version from ENV or {API_VERSION}
      # @return [String]
      def version
        ENV['MOVIEREXX_VERSION'] || @version || VERSION
      end

      # Default include_adult from ENV or {INCLUDE_ADULT}
      # @return [String]
      def include_adult
        ENV['MOVIEREXX_INCLUDE_ADULT'] || @include_adult || INCLUDE_ADULT
      end

      # Default language from ENV or {LANGUAGE}
      # @return [String]
      def language
        ENV['MOVIEREXX_LANGUAGE'] || @language || LANGUAGE
      end
    end
  end
end
