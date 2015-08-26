require "spec_helper"

# Network Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".network", :vcr do
    let(:resource) { tmdb_rexx.network("network-id") }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:name) }
  end
end
