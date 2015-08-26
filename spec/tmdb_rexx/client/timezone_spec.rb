require "spec_helper"

# Timezone Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".timezones", :vcr do
    let(:resource) { tmdb_rexx.timezones.first }

    it "responds to a country code" do
      expect(resource).to respond_to(:AD)
    end
  end
end
