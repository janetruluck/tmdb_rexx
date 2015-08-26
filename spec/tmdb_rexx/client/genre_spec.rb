require "spec_helper"

# Genre Spec
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
    it { expect{ tmdb_rexx.genres("invalid") }.to raise_error(TmdbRexx::InvalidTypeError) }
  end

  describe ".genres", :vcr do
    context "type movies" do
      let(:resource) { tmdb_rexx.genres.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end

    context "type tv" do
      let(:resource) { tmdb_rexx.genres("tv").first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
  end

  describe ".genre_movies", :vcr do
    let(:resource) { tmdb_rexx.genre_movies("genre-id") }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { tmdb_rexx.genre_movies("genre-id").results.first }
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
