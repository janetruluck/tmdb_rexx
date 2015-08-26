require "spec_helper"

# Find Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe "invalid external source" do
    it { expect{ tmdb_rexx.find("some-id", "invalid_source") }.to raise_error(TmdbRexx::InvalidExternalSourceError) }
  end

  describe ".find", :vcr do
    let(:resource) { tmdb_rexx.find("some-id", "imdb_id") }
    it { expect(resource).to respond_to(:movie_results) }
    it { expect(resource).to respond_to(:person_results) }
    it { expect(resource).to respond_to(:tv_results) }
    it { expect(resource).to respond_to(:tv_episode_results) }
    it { expect(resource).to respond_to(:tv_season_results) }

    context ".movie_results" do
      let(:resource) { tmdb_rexx.find("some-id", "imdb_id").movie_results.first }
      it { expect(resource).to respond_to(:adult) }
      it { expect(resource).to respond_to(:backdrop_path) }
      it { expect(resource).to respond_to(:genre_ids) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:original_language) }
      it { expect(resource).to respond_to(:original_title) }
      it { expect(resource).to respond_to(:overview) }
      it { expect(resource).to respond_to(:release_date) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:popularity) }
      it { expect(resource).to respond_to(:title) }
      it { expect(resource).to respond_to(:video) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end
  end
end
