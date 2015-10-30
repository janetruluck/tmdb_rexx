require "spec_helper"

# Person Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }
  let(:id) { "brad-pitt" }

  describe ".person", :vcr do
    let(:resource) { tmdb_rexx.person(id) }
    it { expect(resource).to have_key("adult") }
    it { expect(resource).to have_key("also_known_as") }
    it { expect(resource).to have_key("biography") }
    it { expect(resource).to have_key("birthday") }
    it { expect(resource).to have_key("deathday") }
    it { expect(resource).to have_key("homepage") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("name") }
    it { expect(resource).to have_key("place_of_birth") }
    it { expect(resource).to have_key("profile_path") }
  end

  describe ".person_movie_credits", :vcr do
    let(:resource) { tmdb_rexx.person_movie_credits(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("cast") }

    context '["cast"]' do
      let(:resource) { tmdb_rexx.person_movie_credits(id)["cast"].first }
      it { expect(resource).to have_key("adult") }
      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("original_title") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("release_date") }
      it { expect(resource).to have_key("title") }
    end
  end

  describe ".person_tv_credits", :vcr do
    let(:resource) { tmdb_rexx.person_tv_credits(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("cast") }

    context '["cast"]' do
      let(:resource) { tmdb_rexx.person_tv_credits(id)["cast"].first }
      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("episode_count") }
      it { expect(resource).to have_key("first_air_date") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("original_name") }
      it { expect(resource).to have_key("poster_path") }
    end
  end

  describe ".person_combined_credits", :vcr do
    let(:resource) { tmdb_rexx.person_combined_credits(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("cast") }

    context '["cast"]' do
      let(:resource) { tmdb_rexx.person_combined_credits(id)["cast"].first }
      it { expect(resource).to have_key("adult") }
      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("original_title") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("release_date") }
      it { expect(resource).to have_key("title") }
    end
  end

  describe ".person_external_ids", :vcr do
    let(:resource) { tmdb_rexx.person_external_ids(id) }
    it { expect(resource).to have_key("imdb_id") }
    it { expect(resource).to have_key("freebase_mid") }
    it { expect(resource).to have_key("freebase_id") }
    it { expect(resource).to have_key("tvrage_id") }
    it { expect(resource).to have_key("id") }
  end

  describe ".person_images", :vcr do
    let(:resource) { tmdb_rexx.person_images(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("profiles") }

    context '["profiles"]' do
      let(:resource) { tmdb_rexx.person_images(id)["profiles"].first }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("width") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("aspect_ratio") }
    end
  end

  describe ".person_profiles", :vcr do
    let(:resource) { tmdb_rexx.person_profiles(id).first }
    it { expect(resource).to have_key("file_path") }
    it { expect(resource).to have_key("width") }
    it { expect(resource).to have_key("height") }
    it { expect(resource).to have_key("iso_639_1") }
    it { expect(resource).to have_key("aspect_ratio") }
  end

  describe ".tagged_images", :vcr do
    let(:resource) { tmdb_rexx.tagged_images(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_results") }
    it { expect(resource).to have_key("total_pages") }

    context '["profiles"]' do
      let(:resource) { tmdb_rexx.tagged_images(id)["results"].first }
      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
      it { expect(resource).to have_key("width") }
      it { expect(resource).to have_key("image_type") }
      it { expect(resource).to have_key("media") }
      it { expect(resource).to have_key("media_type") }

      context "['media']" do
        let(:resource) { tmdb_rexx.tagged_images(id)["results"].first["media"] }
        it { expect(resource).to have_key("adult") }
        it { expect(resource).to have_key("backdrop_path") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("original_title") }
        it { expect(resource).to have_key("release_date") }
        it { expect(resource).to have_key("poster_path") }
        it { expect(resource).to have_key("popularity") }
        it { expect(resource).to have_key("title") }
        it { expect(resource).to have_key("vote_average") }
        it { expect(resource).to have_key("vote_count") }
      end
    end
  end

  describe ".person_changes", :vcr do
    let(:resource) { tmdb_rexx.person_changes(id) }
    it { expect(resource).to have_key("changes") }

    context '["changes"]' do
      let(:resource) { tmdb_rexx.person_changes(id)["changes"].first }
      it { expect(resource).to have_key("key") }
      it { expect(resource).to have_key("items") }

      context '["items"]' do
        let(:resource) { tmdb_rexx.person_changes(id)["changes"].first["items"].first }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("action") }
        it { expect(resource).to have_key("time") }
      end
    end
  end

  describe ".latest_person", :vcr do
    let(:resource) { tmdb_rexx.latest_person(id) }
    it { expect(resource).to have_key("adult") }
    it { expect(resource).to have_key("also_known_as") }
    it { expect(resource).to have_key("biography") }
    it { expect(resource).to have_key("birthday") }
    it { expect(resource).to have_key("deathday") }
    it { expect(resource).to have_key("homepage") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("name") }
    it { expect(resource).to have_key("place_of_birth") }
    it { expect(resource).to have_key("profile_path") }
  end

  describe ".popular_people", :vcr do
    let(:resource) { tmdb_rexx.popular_people(id) }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.popular_people(id)["results"].first }
      it { expect(resource).to have_key("adult") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("known_for") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("popularity") }
      it { expect(resource).to have_key("profile_path") }

      context '["known_for"]' do
        let(:resource) { tmdb_rexx.popular_people(id)["results"].first["known_for"].first }
        it { expect(resource).to have_key("adult") }
        it { expect(resource).to have_key("backdrop_path") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("original_title") }
        it { expect(resource).to have_key("release_date") }
        it { expect(resource).to have_key("poster_path") }
        it { expect(resource).to have_key("popularity") }
        it { expect(resource).to have_key("title") }
        it { expect(resource).to have_key("vote_average") }
        it { expect(resource).to have_key("vote_count") }
        it { expect(resource).to have_key("media_type") }
      end
    end
  end
end
