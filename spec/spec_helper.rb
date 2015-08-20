$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pry'
require 'vcr'
require 'json_spec'
require 'movie_rexx'

Dir[File.expand_path("spec/support/**/*.rb", __FILE__)].each {|f| require f}

JsonSpec.directory = "spec/support/mocks"

RSpec.configure do |config|
  config.include JsonSpec::Helpers
  config.treat_symbols_as_metadata_keys_with_true_values = true
end

VCR.configure do |config|
  config.cassette_library_dir = "spec/support/vcr_cassettes"
  config.hook_into :webmock # or :fakeweb
  config.configure_rspec_metadata!
end
