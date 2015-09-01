require "spec_helper"

# TV Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }
  let(:id) { "breaking-bad" }

  describe ".tv", :vcr do
    let(:resource) { tmdb_rexx.tv(id) }
    it { expect(resource).to respond_to(:backdrop_path) }
    it { expect(resource).to respond_to(:created_by) }
    it { expect(resource).to respond_to(:episode_run_time) }
    it { expect(resource).to respond_to(:first_air_date) }
    it { expect(resource).to respond_to(:genres) }
    it { expect(resource).to respond_to(:homepage) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:in_production) }
    it { expect(resource).to respond_to(:languages) }
    it { expect(resource).to respond_to(:last_air_date) }
    it { expect(resource).to respond_to(:name) }
    it { expect(resource).to respond_to(:networks) }
    it { expect(resource).to respond_to(:number_of_episodes) }
    it { expect(resource).to respond_to(:number_of_seasons) }
    it { expect(resource).to respond_to(:origin_country) }
    it { expect(resource).to respond_to(:original_language) }
    it { expect(resource).to respond_to(:original_name) }
    it { expect(resource).to respond_to(:overview) }
    it { expect(resource).to respond_to(:popularity) }
    it { expect(resource).to respond_to(:poster_path) }
    it { expect(resource).to respond_to(:production_companies) }
    it { expect(resource).to respond_to(:seasons) }
    it { expect(resource).to respond_to(:status) }
    it { expect(resource).to respond_to(:type) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }
    context ".created_by" do
      let(:resource) { tmdb_rexx.tv(id).created_by.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:profile_path) }
    end
    context ".genres" do
      let(:resource) { tmdb_rexx.tv(id).genres.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
    context ".networks" do
      let(:resource) { tmdb_rexx.tv(id).networks.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
    context ".production_companies" do
      let(:resource) { tmdb_rexx.tv(id).production_companies.first }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:id) }
    end
    context ".seasons" do
      let(:resource) { tmdb_rexx.tv(id).seasons.first }
      it { expect(resource).to respond_to(:air_date) }
      it { expect(resource).to respond_to(:episode_count) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:season_number) }
    end
  end

  describe ".tv_account_states", :vcr do
    let(:resource) { tmdb_rexx.tv_account_states(id) }
    xit { expect(resource).to respond_to(:id) }
    xit { expect(resource).to respond_to(:favorite) }
    xit { expect(resource).to respond_to(:rated) }
    xit { expect(resource).to respond_to(:watchlist) }
    context ".titles" do
      let(:resource) { tmdb_rexx.movie_alternative_titles(id).rated.first }
      xit { expect(resource).to respond_to(:value) }
    end
  end

  describe ".tv_alternative_titles", :vcr do
    let(:resource) { tmdb_rexx.tv_alternative_titles(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:results) }
    context ".results" do
      let(:resource) { tmdb_rexx.tv_alternative_titles(id).results.first }
      it { expect(resource).to respond_to(:title) }
      it { expect(resource).to respond_to(:iso_3166_1) }
    end
  end

  describe ".tv_changes", :vcr do
    let(:resource) { tmdb_rexx.tv_changes(id) }
    it { expect(resource).to respond_to(:changes) }

    context ".changes" do
      let(:resource) { tmdb_rexx.tv_changes(id).changes.first }
      it { expect(resource).to respond_to(:key) }
      it { expect(resource).to respond_to(:items) }

      context ".items" do
        let(:resource) { tmdb_rexx.tv_changes(id).changes.first.items.first }
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:action) }
        it { expect(resource).to respond_to(:time) }
        it { expect(resource).to respond_to(:value) }
      end
    end
  end

  describe ".tv_content_ratings", :vcr do
    let(:resource) { tmdb_rexx.tv_content_ratings(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:results) }

    context ".results" do
      let(:resource) { tmdb_rexx.tv_content_ratings(id).results.first }
      it { expect(resource).to respond_to(:iso_3166_1) }
      it { expect(resource).to respond_to(:rating) }
    end
  end

  describe ".tv_credits", :vcr do
    let(:resource) { tmdb_rexx.tv_credits(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:cast) }
    it { expect(resource).to respond_to(:crew) }

    context ".cast" do
      let(:resource) { tmdb_rexx.tv_credits(id).cast.first }
      it { expect(resource).to respond_to(:character) }
      it { expect(resource).to respond_to(:credit_id) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:order) }
      it { expect(resource).to respond_to(:profile_path) }
    end

    context ".crew" do
      let(:resource) { tmdb_rexx.tv_credits(id).crew.first }
      it { expect(resource).to respond_to(:department) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:job) }
      it { expect(resource).to respond_to(:profile_path) }
    end
  end

  describe ".tv_external_ids", :vcr do
    let(:resource) { tmdb_rexx.tv_external_ids(id) }
    it { expect(resource).to respond_to(:imdb_id) }
    it { expect(resource).to respond_to(:freebase_id) }
    it { expect(resource).to respond_to(:freebase_mid) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:tvdb_id) }
    it { expect(resource).to respond_to(:tvrage_id) }
  end

  describe ".tv_images", :vcr do
    let(:resource) { tmdb_rexx.tv_images(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:backdrops) }
    it { expect(resource).to respond_to(:posters) }

    context ".backdrops" do
      let(:resource) { tmdb_rexx.tv_images(id).backdrops.first }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:width) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:aspect_ratio) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end

    context ".posters" do
      let(:resource) { tmdb_rexx.tv_images(id).posters.first }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:width) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:aspect_ratio) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end
  end

  describe ".tv_backdrops", :vcr do
    let(:resource) { tmdb_rexx.tv_backdrops(id).first }
    it { expect(resource).to respond_to(:file_path) }
    it { expect(resource).to respond_to(:width) }
    it { expect(resource).to respond_to(:height) }
    it { expect(resource).to respond_to(:iso_639_1) }
    it { expect(resource).to respond_to(:aspect_ratio) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }
  end

  describe ".tv_posters", :vcr do
    let(:resource) { tmdb_rexx.tv_posters(id).first }
    it { expect(resource).to respond_to(:file_path) }
    it { expect(resource).to respond_to(:width) }
    it { expect(resource).to respond_to(:height) }
    it { expect(resource).to respond_to(:iso_639_1) }
    it { expect(resource).to respond_to(:aspect_ratio) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }
  end

  describe ".tv_keywords", :vcr do
    let(:resource) { tmdb_rexx.tv_keywords(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:results) }

    context ".results" do
      let(:resource) { tmdb_rexx.tv_keywords(id).results.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
  end

  describe ".similar_tvs", :vcr do
    let(:resource) { tmdb_rexx.similar_tvs(id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { tmdb_rexx.similar_tvs(id).results.first }
      it { expect(resource).to respond_to(:backdrop_path) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:original_name) }
      it { expect(resource).to respond_to(:first_air_date) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:popularity) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end
  end

  describe ".tv_translations", :vcr do
    let(:resource) { tmdb_rexx.tv_translations(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:translations) }

    context ".translations" do
      let(:resource) { tmdb_rexx.tv_translations(id).translations.first }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:english_name) }
    end
  end

  describe ".tv_videos", :vcr do
    let(:resource) { tmdb_rexx.tv_videos(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:results) }

    context ".results" do
      let(:resource) { tmdb_rexx.tv_videos(id).results.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:key) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:site) }
      it { expect(resource).to respond_to(:size) }
      it { expect(resource).to respond_to(:type) }
    end
  end

  describe ".latest_tv", :vcr do
    let(:resource) { tmdb_rexx.latest_tv(id) }
    it { expect(resource).to respond_to(:backdrop_path) }
    it { expect(resource).to respond_to(:created_by) }
    it { expect(resource).to respond_to(:episode_run_time) }
    it { expect(resource).to respond_to(:first_air_date) }
    it { expect(resource).to respond_to(:genres) }
    it { expect(resource).to respond_to(:homepage) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:in_production) }
    it { expect(resource).to respond_to(:languages) }
    it { expect(resource).to respond_to(:last_air_date) }
    it { expect(resource).to respond_to(:name) }
    it { expect(resource).to respond_to(:networks) }
    it { expect(resource).to respond_to(:number_of_episodes) }
    it { expect(resource).to respond_to(:number_of_seasons) }
    it { expect(resource).to respond_to(:origin_country) }
    it { expect(resource).to respond_to(:original_name) }
    it { expect(resource).to respond_to(:overview) }
    it { expect(resource).to respond_to(:popularity) }
    it { expect(resource).to respond_to(:poster_path) }
    it { expect(resource).to respond_to(:seasons) }
    it { expect(resource).to respond_to(:status) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }
    context ".created_by" do
      let(:resource) { tmdb_rexx.latest_tv(id).created_by.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:profile_path) }
    end
    context ".genres" do
      let(:resource) { tmdb_rexx.latest_tv(id).genres.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
    context ".networks" do
      let(:resource) { tmdb_rexx.latest_tv(id).networks.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
    context ".seasons" do
      let(:resource) { tmdb_rexx.tv(id).seasons.first }
      it { expect(resource).to respond_to(:air_date) }
      it { expect(resource).to respond_to(:episode_count) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:season_number) }
    end
  end

  describe ".on_the_air_tv", :vcr do
    let(:resource) { tmdb_rexx.on_the_air_tv(id) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }
    context ".results" do
      let(:resource) { tmdb_rexx.on_the_air_tv(id).results.first }
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

  describe ".airing_today_tv", :vcr do
    let(:resource) { tmdb_rexx.airing_today_tv(id) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }
    context ".results" do
      let(:resource) { tmdb_rexx.airing_today_tv(id).results.first }
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

  describe ".top_rated_tv", :vcr do
    let(:resource) { tmdb_rexx.top_rated_tv(id) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }
    context ".results" do
      let(:resource) { tmdb_rexx.top_rated_tv(id).results.first }
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

  describe ".popular_tv", :vcr do
    let(:resource) { tmdb_rexx.popular_tv(id) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }
    context ".results" do
      let(:resource) { tmdb_rexx.popular_tv(id).results.first }
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
