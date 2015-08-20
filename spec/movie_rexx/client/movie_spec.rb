require "spec_helper"

# Movie Spec
describe MovieRexx::Client do
  before do
    MovieRexx.reset!
    MovieRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:movie_rexx) { MovieRexx::Client.new }
  let(:id) { "fight-club" }

  describe ".movie", :vcr do
    let(:resource) { movie_rexx.movie(id) }
    it { expect(resource).to respond_to(:adult) }
    it { expect(resource).to respond_to(:backdrop_path) }
    it { expect(resource).to respond_to(:belongs_to_collection) }
    it { expect(resource).to respond_to(:budget) }
    it { expect(resource).to respond_to(:genres) }
    it { expect(resource).to respond_to(:homepage) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:imdb_id) }
    it { expect(resource).to respond_to(:original_language) }
    it { expect(resource).to respond_to(:original_title) }
    it { expect(resource).to respond_to(:overview) }
    it { expect(resource).to respond_to(:popularity) }
    it { expect(resource).to respond_to(:poster_path) }
    it { expect(resource).to respond_to(:production_companies) }
    it { expect(resource).to respond_to(:production_countries) }
    it { expect(resource).to respond_to(:release_date) }
    it { expect(resource).to respond_to(:revenue) }
    it { expect(resource).to respond_to(:runtime) }
    it { expect(resource).to respond_to(:spoken_languages) }
    it { expect(resource).to respond_to(:status) }
    it { expect(resource).to respond_to(:tagline) }
    it { expect(resource).to respond_to(:title) }
    it { expect(resource).to respond_to(:video) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }
  end

  describe ".movie_alternative_titles", :vcr do
    let(:resource) { movie_rexx.movie_alternative_titles(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:titles) }

    context ".titles" do
      let(:resource) { movie_rexx.movie_alternative_titles(id).titles.first }
      it { expect(resource).to respond_to(:title) }
      it { expect(resource).to respond_to(:iso_3166_1) }
    end
  end

  describe ".movie_credits", :vcr do
    let(:resource) { movie_rexx.movie_credits(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:cast) }

    context ".cast" do
      let(:resource) { movie_rexx.movie_credits(id).cast.first }
      it { expect(resource).to respond_to(:cast_id) }
      it { expect(resource).to respond_to(:character) }
      it { expect(resource).to respond_to(:credit_id) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:order) }
      it { expect(resource).to respond_to(:profile_path) }
    end
  end

  describe ".movie_images", :vcr do
    let(:resource) { movie_rexx.movie_images(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:backdrops) }
    it { expect(resource).to respond_to(:posters) }

    context ".backdrops" do
      let(:resource) { movie_rexx.movie_images(id).backdrops.first }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:width) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:aspect_ratio) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end

    context ".posters" do
      let(:resource) { movie_rexx.movie_images(id).posters.first }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:width) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:aspect_ratio) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end
  end

  describe ".movie_backdrops", :vcr do
    let(:resource) { movie_rexx.movie_backdrops(id).first }
    it { expect(resource).to respond_to(:file_path) }
    it { expect(resource).to respond_to(:width) }
    it { expect(resource).to respond_to(:height) }
    it { expect(resource).to respond_to(:iso_639_1) }
    it { expect(resource).to respond_to(:aspect_ratio) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }
  end

  describe ".movie_posters", :vcr do
    let(:resource) { movie_rexx.movie_posters(id).first }
    it { expect(resource).to respond_to(:file_path) }
    it { expect(resource).to respond_to(:width) }
    it { expect(resource).to respond_to(:height) }
    it { expect(resource).to respond_to(:iso_639_1) }
    it { expect(resource).to respond_to(:aspect_ratio) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }
  end

  describe ".movie_keywords", :vcr do
    let(:resource) { movie_rexx.movie_keywords(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:keywords) }

    context ".keywords" do
      let(:resource) { movie_rexx.movie_keywords(id).keywords.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end
  end

  describe ".movie_releases", :vcr do
    let(:resource) { movie_rexx.movie_releases(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:countries) }

    context ".countries" do
      let(:resource) { movie_rexx.movie_releases(id).countries.first }
      it { expect(resource).to respond_to(:certification) }
      it { expect(resource).to respond_to(:iso_3166_1) }
      it { expect(resource).to respond_to(:primary) }
      it { expect(resource).to respond_to(:release_date) }
    end
  end

  describe ".movie_videos", :vcr do
    let(:resource) { movie_rexx.movie_videos(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:results) }

    context ".results" do
      let(:resource) { movie_rexx.movie_videos(id).results.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:key) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:site) }
      it { expect(resource).to respond_to(:size) }
      it { expect(resource).to respond_to(:type) }
    end
  end

  describe ".movie_translations", :vcr do
    let(:resource) { movie_rexx.movie_translations(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:translations) }

    context ".translations" do
      let(:resource) { movie_rexx.movie_translations(id).translations.first }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:english_name) }
    end
  end

  describe ".similar_movies", :vcr do
    let(:resource) { movie_rexx.similar_movies(id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }

    context ".results" do
      let(:resource) { movie_rexx.similar_movies(id).results.first }
      it { expect(resource).to respond_to(:adult) }
      it { expect(resource).to respond_to(:backdrop_path) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:original_title) }
      it { expect(resource).to respond_to(:release_date) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:popularity) }
      it { expect(resource).to respond_to(:title) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end

  end

  describe ".movie_reviews", :vcr do
    let(:resource) { movie_rexx.movie_reviews(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }

    context ".results" do
      let(:resource) { movie_rexx.movie_reviews(id).results.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:author) }
      it { expect(resource).to respond_to(:content) }
      it { expect(resource).to respond_to(:url) }
    end
  end

  describe ".movie_lists", :vcr do
    let(:resource) { movie_rexx.movie_lists(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { movie_rexx.movie_lists(id).results.first }
      it { expect(resource).to respond_to(:description) }
      it { expect(resource).to respond_to(:favorite_count) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:item_count) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:poster_path) }
    end
  end

  describe ".movie_lists", :vcr do
    let(:resource) { movie_rexx.movie_lists(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { movie_rexx.movie_lists(id).results.first }
      it { expect(resource).to respond_to(:description) }
      it { expect(resource).to respond_to(:favorite_count) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:item_count) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:poster_path) }
    end
  end

  describe ".movie_changes", :vcr do
    let(:resource) { movie_rexx.movie_changes(id) }
    it { expect(resource).to respond_to(:changes) }

    context ".changes" do
      let(:resource) { movie_rexx.movie_changes(id).changes.first }
      it { expect(resource).to respond_to(:key) }
      it { expect(resource).to respond_to(:items) }

      context ".items" do
        let(:resource) { movie_rexx.movie_changes(id).changes.first.items.first }
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:action) }
        it { expect(resource).to respond_to(:time) }
      end
    end
  end

  describe ".latest_movie", :vcr do
    let(:resource) { movie_rexx.latest_movie(id) }
    it { expect(resource).to respond_to(:adult) }
    it { expect(resource).to respond_to(:backdrop_path) }
    it { expect(resource).to respond_to(:belongs_to_collection) }
    it { expect(resource).to respond_to(:budget) }
    it { expect(resource).to respond_to(:genres) }
    it { expect(resource).to respond_to(:homepage) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:imdb_id) }
    it { expect(resource).to respond_to(:original_title) }
    it { expect(resource).to respond_to(:overview) }
    it { expect(resource).to respond_to(:popularity) }
    it { expect(resource).to respond_to(:poster_path) }
    it { expect(resource).to respond_to(:production_companies) }
    it { expect(resource).to respond_to(:production_countries) }
    it { expect(resource).to respond_to(:release_date) }
    it { expect(resource).to respond_to(:revenue) }
    it { expect(resource).to respond_to(:runtime) }
    it { expect(resource).to respond_to(:spoken_languages) }
    it { expect(resource).to respond_to(:tagline) }
    it { expect(resource).to respond_to(:title) }
    it { expect(resource).to respond_to(:vote_average) }
    it { expect(resource).to respond_to(:vote_count) }

    context ".production_companies" do
      let(:resource) { movie_rexx.latest_movie(id).production_companies.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
    end

    context ".production_countries" do
      let(:resource) { movie_rexx.latest_movie(id).production_countries.first }
      it { expect(resource).to respond_to(:iso_3166_1) }
      it { expect(resource).to respond_to(:name) }
    end

    context ".spoken_languages" do
      let(:resource) { movie_rexx.latest_movie(id).spoken_languages.first }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:name) }
    end
  end

  describe ".now_playing", :vcr do
    let(:resource) { movie_rexx.now_playing(id) }
    it { expect(resource).to respond_to(:dates) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { movie_rexx.now_playing(id).results.first }
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

  describe ".popular_movies", :vcr do
    let(:resource) { movie_rexx.popular_movies(id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { movie_rexx.popular_movies(id).results.first }
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

  describe ".top_rated_movies", :vcr do
    let(:resource) { movie_rexx.top_rated_movies(id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { movie_rexx.top_rated_movies(id).results.first }
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

  describe ".upcoming", :vcr do
    let(:resource) { movie_rexx.upcoming(id) }
    it { expect(resource).to respond_to(:dates) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { movie_rexx.upcoming(id).results.first }
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
