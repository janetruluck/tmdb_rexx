require "spec_helper"

# Changes Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe "invalid type" do
    it { expect{ tmdb_rexx.changes("invalid") }.to raise_error(TmdbRexx::InvalidTypeError) }
  end

  describe ".changes", :vcr do
    let(:resource) { tmdb_rexx.changes("movie") }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { tmdb_rexx.changes("movie").results.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:adult) }
    end
  end
end
