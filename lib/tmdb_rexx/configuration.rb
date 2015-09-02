module TmdbRexx
  module Configuration
    VALID_OPTION_KEYS = %i(api_key base_url version include_adult language).freeze

    attr_accessor(*VALID_OPTION_KEYS)

    class << self
      def keys
        @keys ||= VALID_OPTION_KEYS
      end
    end

    def configure
      yield self
    end

    # Reset configuration options to default values
    def reset!
      TmdbRexx::Configuration.keys.each do |key|
        instance_variable_set(
          :"@#{key}",
          TmdbRexx::Default.const_get(key.upcase)
        )
      end
      self
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

    private

    def options
      Hash[TmdbRexx::Configuration.keys.map{|key|
        [key, instance_variable_get(:"@#{key}")]
      }]
    end
  end
end
