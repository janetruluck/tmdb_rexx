require "spec_helper"

# Person Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }
  let(:id) { "brad-pitt" }

  describe ".person", :vcr do
    let(:resource) { tmdb_rexx.person(id) }
    it { expect(resource).to respond_to(:adult) }
    it { expect(resource).to respond_to(:also_known_as) }
    it { expect(resource).to respond_to(:biography) }
    it { expect(resource).to respond_to(:birthday) }
    it { expect(resource).to respond_to(:deathday) }
    it { expect(resource).to respond_to(:homepage) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:name) }
    it { expect(resource).to respond_to(:place_of_birth) }
    it { expect(resource).to respond_to(:profile_path) }
  end

  describe ".person_movie_credits", :vcr do
    let(:resource) { tmdb_rexx.person_movie_credits(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:cast) }

    context ".cast" do
      let(:resource) { tmdb_rexx.person_movie_credits(id).cast.first }
      it { expect(resource).to respond_to(:adult) }
      it { expect(resource).to respond_to(:character) }
      it { expect(resource).to respond_to(:credit_id) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:original_title) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:release_date) }
      it { expect(resource).to respond_to(:title) }
    end
  end

  describe ".person_tv_credits", :vcr do
    let(:resource) { tmdb_rexx.person_tv_credits(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:cast) }

    context ".cast" do
      let(:resource) { tmdb_rexx.person_tv_credits(id).cast.first }
      it { expect(resource).to respond_to(:character) }
      it { expect(resource).to respond_to(:credit_id) }
      it { expect(resource).to respond_to(:episode_count) }
      it { expect(resource).to respond_to(:first_air_date) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:original_name) }
      it { expect(resource).to respond_to(:poster_path) }
    end
  end

  describe ".person_combined_credits", :vcr do
    let(:resource) { tmdb_rexx.person_combined_credits(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:cast) }

    context ".cast" do
      let(:resource) { tmdb_rexx.person_combined_credits(id).cast.first }
      it { expect(resource).to respond_to(:adult) }
      it { expect(resource).to respond_to(:character) }
      it { expect(resource).to respond_to(:credit_id) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:original_title) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:release_date) }
      it { expect(resource).to respond_to(:title) }
    end
  end

  describe ".person_external_ids", :vcr do
    let(:resource) { tmdb_rexx.person_external_ids(id) }
    it { expect(resource).to respond_to(:imdb_id) }
    it { expect(resource).to respond_to(:freebase_mid) }
    it { expect(resource).to respond_to(:freebase_id) }
    it { expect(resource).to respond_to(:tvrage_id) }
    it { expect(resource).to respond_to(:id) }
  end

  describe ".person_images", :vcr do
    let(:resource) { tmdb_rexx.person_images(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:profiles) }

    context ".profiles" do
      let(:resource) { tmdb_rexx.person_images(id).profiles.first }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:width) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:aspect_ratio) }
    end
  end

  describe ".person_profiles", :vcr do
    let(:resource) { tmdb_rexx.person_profiles(id).first }
    it { expect(resource).to respond_to(:file_path) }
    it { expect(resource).to respond_to(:width) }
    it { expect(resource).to respond_to(:height) }
    it { expect(resource).to respond_to(:iso_639_1) }
    it { expect(resource).to respond_to(:aspect_ratio) }
  end

  describe ".tagged_images", :vcr do
    let(:resource) { tmdb_rexx.tagged_images(id) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_results) }
    it { expect(resource).to respond_to(:total_pages) }

    context ".profiles" do
      let(:resource) { tmdb_rexx.tagged_images(id).results.first }
      it { expect(resource).to respond_to(:aspect_ratio) }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
      it { expect(resource).to respond_to(:width) }
      it { expect(resource).to respond_to(:image_type) }
      it { expect(resource).to respond_to(:media) }
      it { expect(resource).to respond_to(:media_type) }

      context ".media" do
        let(:resource) { tmdb_rexx.tagged_images(id).results.first.media }
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
  end

  describe ".person_changes", :vcr do
    let(:resource) { tmdb_rexx.person_changes(id) }
    it { expect(resource).to respond_to(:changes) }

    context ".changes" do
      let(:resource) { tmdb_rexx.person_changes(id).changes.first }
      it { expect(resource).to respond_to(:key) }
      it { expect(resource).to respond_to(:items) }

      context ".items" do
        let(:resource) { tmdb_rexx.person_changes(id).changes.first.items.first }
        it { expect(resource).to respond_to(:id) }
        it { expect(resource).to respond_to(:action) }
        it { expect(resource).to respond_to(:time) }
      end
    end
  end

  describe ".latest_person", :vcr do
    let(:resource) { tmdb_rexx.latest_person(id) }
    it { expect(resource).to respond_to(:adult) }
    it { expect(resource).to respond_to(:also_known_as) }
    it { expect(resource).to respond_to(:biography) }
    it { expect(resource).to respond_to(:birthday) }
    it { expect(resource).to respond_to(:deathday) }
    it { expect(resource).to respond_to(:homepage) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:name) }
    it { expect(resource).to respond_to(:place_of_birth) }
    it { expect(resource).to respond_to(:profile_path) }
  end

  describe ".popular_people", :vcr do
    let(:resource) { tmdb_rexx.popular_people(id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { tmdb_rexx.popular_people(id).results.first }
      it { expect(resource).to respond_to(:adult) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:known_for) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:popularity) }
      it { expect(resource).to respond_to(:profile_path) }

      context ".known_for" do
        let(:resource) { tmdb_rexx.popular_people(id).results.first.known_for.first }
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
        it { expect(resource).to respond_to(:media_type) }
      end
    end
  end
end
