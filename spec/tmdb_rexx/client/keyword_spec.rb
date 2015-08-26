require "spec_helper"

# Keyword Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".keyword", :vcr do
    context "type movies" do
      let(:resource) { tmdb_rexx.keyword("keyword-id") }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
  end

  describe ".keyword_movies", :vcr do
    let(:resource) { tmdb_rexx.keyword_movies("keyword-id") }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { tmdb_rexx.keyword_movies("keyword-id").results.first }
      it { expect(resource).to respond_to(:backdrop_path) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:original_title) }
      it { expect(resource).to respond_to(:release_date) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:title) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end
  end
end
