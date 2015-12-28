require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'vcr'
require 'json_spec'
require 'tmdb_rexx'

Dir[File.expand_path("spec/support/**/*.rb", __FILE__)].each {|f| require f}

JsonSpec.directory = "spec/support/mocks"

module TmdbRexxSetup
  def initialize_client
    private_key = "81c8ca17c"

    before do
      TmdbRexx.reset!
      TmdbRexx.configure do |c|
        c.base_url = "http://private-anon-#{private_key}-themoviedb.apiary-mock.com"
        c.api_key = "12345KEY"
      end
    end
  end
end

RSpec.configure do |config|
  config.include JsonSpec::Helpers
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.extend TmdbRexxSetup
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/support/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.configure_rspec_metadata!
  config.ignore_hosts 'codeclimate.com'
end
