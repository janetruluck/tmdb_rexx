require "spec_helper"

# Network Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".network", :vcr do
    let(:resource) { tmdb_rexx.network("network-id") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("name") }
  end
end
