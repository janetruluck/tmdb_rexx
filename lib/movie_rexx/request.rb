module MovieRexx
  module Request
    def get(path, options = {})
      request(:get, path, options)
    end

    def post(path, options = {})
      request(:post, path, options)
    end

    def put(path, options = {})
      request(:put, path, options)
    end

    def delete(path, options = {})
      request(:delete, path, options)
    end

    def last_response
      @last_response if defined? @last_response
    end

    private
    def request(method, path, options = {})
      url = options.delete(:api_endpoint) || api_endpoint

      connection_options = {
        :url => url
      }

      @last_response = response = connection(connection_options).send(method) do |request|
        request.url(path, options)
        request.params['api_key'] = @api_key
      end

      response.body
    end
  end
end
