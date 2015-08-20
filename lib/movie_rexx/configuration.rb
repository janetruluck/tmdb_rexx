module MovieRexx
  module Configuration
    VALID_OPTION_KEYS = %i(api_key base_url version include_adult language).freeze

    #attr_accessor(*VALID_OPTION_KEYS)
    attr_accessor :api_key, :base_url, :version, :include_adult, :language

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
      MovieRexx::Configuration.keys.each do |key|
        instance_variable_set(:"@#{key}", MovieRexx::Default.options[key])
      end
      self
    end

    def respond_to?(method, include_private=false)
      new.respond_to?(method, include_private) || super(method, include_private)
    end

    private

    def options
      Hash[MovieRexx::Configuration.keys.map{|key|
        [key, instance_variable_get(:"@#{key}")]
      }]
    end
  end
end
