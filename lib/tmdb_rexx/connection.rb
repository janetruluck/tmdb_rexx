require "json"
require "faraday_middleware"

module TmdbRexx
  module Connection
    def connection(options = {})
      Faraday.new(options) do |build|
        build.request :url_encoded
        build.response :json, :content_type => /\bjson$/
        build.adapter  Faraday.default_adapter
      end
    end
  end
end
