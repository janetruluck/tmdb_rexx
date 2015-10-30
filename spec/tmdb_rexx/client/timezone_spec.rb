require "spec_helper"

# Timezone Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".timezones", :vcr do
    let(:resource) { tmdb_rexx.timezones.first }

    it "responds to a country code" do
      expect(resource).to have_key("AD")
    end
  end
end
