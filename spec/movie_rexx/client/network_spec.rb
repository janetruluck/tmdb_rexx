require "spec_helper"

# Network Spec
describe MovieRexx::Client do
  before do
    MovieRexx.reset!
    MovieRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:movie_rexx) { MovieRexx::Client.new }

  describe ".network", :vcr do
    let(:resource) { movie_rexx.network("network-id") }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:name) }
  end
end
