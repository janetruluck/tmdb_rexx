require "spec_helper"

# Timezone Spec
describe MovieRexx::Client do
  before do
    MovieRexx.reset!
    MovieRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:movie_rexx) { MovieRexx::Client.new }

  describe ".timezones", :vcr do
    let(:resource) { movie_rexx.timezones.first }

    it "responds to a country code" do
      expect(resource).to respond_to(:AD)
    end
  end
end
