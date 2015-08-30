require "spec_helper"

# Search Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".search", :vcr do
    context "company" do
      let(:type) { "company" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first}
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:logo_path) }
        it { expect(resource).to respond_to(:name) }
      end
    end

    context "collection" do
      let(:type) { "collection" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first}
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:backdrop_path) }
        it { expect(resource).to respond_to(:name) }
        it { expect(resource).to respond_to(:poster_path) }
      end
    end

    context "keyword" do
      let(:type) { "keyword" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first}
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:name) }
      end
    end

    context "list" do
      let(:type) { "list" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first}
        it { expect(resource).to respond_to(:description) }
        it { expect(resource).to respond_to(:favorite_count) }
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:item_count) }
        it { expect(resource).to respond_to(:iso_639_1) }
        it { expect(resource).to respond_to(:list_type) }
        it { expect(resource).to respond_to(:name) }
        it { expect(resource).to respond_to(:poster_path) }
      end
    end

    context "movie" do
      let(:type) { "movie" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first}
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

    context "multi" do
      let(:type) { "multi" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first}
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
        it { expect(resource).to respond_to(:media_type) }
      end
    end

    context "person" do
      let(:type) { "person" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first}
        it { expect(resource).to respond_to(:adult) }
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:known_for) }
        it { expect(resource).to respond_to(:name) }
        it { expect(resource).to respond_to(:popularity) }
        it { expect(resource).to respond_to(:profile_path) }

        context ".known_for" do
          let(:resource) { tmdb_rexx.search(type, query).results.first.known_for.first }
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
          it { expect(resource).to respond_to(:media_type) }
        end
      end
    end

    context "tv" do
      let(:type) { "tv" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to respond_to(:page) }
      it { expect(resource).to respond_to(:results) }
      it { expect(resource).to respond_to(:total_pages) }
      it { expect(resource).to respond_to(:total_results) }

      context ".results" do
        let(:resource) { tmdb_rexx.search(type, query).results.first }
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
