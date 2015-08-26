require "spec_helper"

# Review Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".review", :vcr do
    let(:resource) { tmdb_rexx.review("review-id") }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:author) }
    it { expect(resource).to respond_to(:content) }
    it { expect(resource).to respond_to(:iso_639_1) }
    it { expect(resource).to respond_to(:media_id) }
    it { expect(resource).to respond_to(:media_title) }
    it { expect(resource).to respond_to(:media_type) }
    it { expect(resource).to respond_to(:url) }
  end
end
