require "spec_helper"

# Discover Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".discover", :vcr do
    context "movie" do
      let(:resource) { tmdb_rexx.discover("movie", { primary_release_year: 2015 }) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.discover("movie", { primary_release_year: 2015 }).results.first }
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

    context "tv" do
      let(:resource) { tmdb_rexx.discover("tv", { "first_air_date.lte" => "2015-01-01" }) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.discover("tv", { "first_air_date.lte" => "2015-01-01" }).results.first }
        it { expect(resource).to respond_to(:backdrop_path) }
        it { expect(resource).to respond_to(:first_air_date) }
        it { expect(resource).to respond_to(:genre_ids) }
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:original_language) }
        it { expect(resource).to respond_to(:original_name) }
        it { expect(resource).to respond_to(:overview) }
        it { expect(resource).to respond_to(:origin_country) }
        it { expect(resource).to respond_to(:poster_path) }
        it { expect(resource).to respond_to(:popularity) }
        it { expect(resource).to respond_to(:name) }
        it { expect(resource).to respond_to(:vote_average) }
        it { expect(resource).to respond_to(:vote_count) }
      end
    end
  end
end
