require "spec_helper"

# TV Season Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }
  let(:id) { "breaking-bad" }
  let(:season_number) { "1" }
  let(:season_id) { "3572" }

  describe "#tv_season", :vcr do
    let(:resource) { tmdb_rexx.tv_season(id, season_number) }

    it { expect(resource).to have_key("air_date") }
    it { expect(resource).to have_key("episodes") }
    it { expect(resource).to have_key("name") }
    it { expect(resource).to have_key("overview") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("poster_path") }
    it { expect(resource).to have_key("season_number") }

    context '["episodes"]' do
      let(:resource) { tmdb_rexx.tv_season(id, season_number)["episodes"].first }

      it { expect(resource).to have_key("air_date") }
      it { expect(resource).to have_key("crew") }
      it { expect(resource).to have_key("episode_number") }
      it { expect(resource).to have_key("guest_stars") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("overview") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("production_code") }
      it { expect(resource).to have_key("season_number") }
      it { expect(resource).to have_key("still_path") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end

    context '["episodes"]["crew"]' do
      let(:resource) { tmdb_rexx.tv_season(id, season_number)["episodes"].first['crew'].first }

      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("department") }
      it { expect(resource).to have_key("job") }
      it { expect(resource).to have_key("profile_path") }
    end

    context '["episodes"]["guest_stars"]' do
      let(:resource) { tmdb_rexx.tv_season(id, season_number)["episodes"].first['guest_stars'].first }

      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("order") }
      it { expect(resource).to have_key("profile_path") }
    end
  end

  describe "#tv_season_changes", :vcr do
    let(:resource) { tmdb_rexx.tv_season_changes(season_id) }

    it { expect(resource).to have_key("changes") }

    context '["changes"]' do
      let(:resource) { tmdb_rexx.tv_season_changes(season_id)["changes"].first }

      it { expect(resource).to have_key("key") }
      it { expect(resource).to have_key("items") }
    end

    context '["changes"]["items"]' do
      let(:resource) { tmdb_rexx.tv_season_changes(season_id)["changes"].first['items'].first }

      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("action") }
      it { expect(resource).to have_key("time") }
      it { expect(resource).to have_key("value") }
    end

    context '["changes"]["items"]["value"]' do
      let(:resource) {
        tmdb_rexx.tv_season_changes(season_id)["changes"].first['items'].first['value']
      }

      it { expect(resource).to have_key("episode_number") }
      it { expect(resource).to have_key("episode_id") }
    end
  end

  describe "#tv_season_account_states", :vcr do
    let(:resource) { tmdb_rexx.tv_season_account_states(id, season_number) }

    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.tv_season_account_states(id, season_number)["results"].first }

      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("episode_number") }
      it { expect(resource).to have_key("rated") }
    end

    context '["results"]["rated"]' do
      let(:resource) { tmdb_rexx.tv_season_account_states(id, season_number)["results"].first['rated'] }

      it { expect(resource).to have_key("value") }
    end
  end

  describe "#tv_season_credits", :vcr do
    let(:resource) { tmdb_rexx.tv_season_credits(id, season_number) }

    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("cast") }
    it { expect(resource).to have_key("crew") }

    context '["cast"]' do
      let(:resource) { tmdb_rexx.tv_season_credits(id, season_number)["cast"].first }

      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("profile_path") }
      it { expect(resource).to have_key("order") }
    end

    context '["crew"]' do
      let(:resource) { tmdb_rexx.tv_season_credits(id, season_number)["crew"].first }

      it { expect(resource).to have_key("department") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("job") }
      it { expect(resource).to have_key("profile_path") }
    end
  end

  describe "#tv_season_external_ids", :vcr do
    let(:resource) { tmdb_rexx.tv_season_external_ids(id, season_number) }

    it { expect(resource).to have_key("freebase_id") }
    it { expect(resource).to have_key("freebase_mid") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("tvdb_id") }
    it { expect(resource).to have_key("tvrage_id") }
  end

  describe "#tv_season_images", :vcr do
    let(:resource) { tmdb_rexx.tv_season_images(id, season_number) }

    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("posters") }

    context '["posters"]' do
      let(:resource) { tmdb_rexx.tv_season_images(id, season_number)["posters"].first }

      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
      it { expect(resource).to have_key("width") }
    end
  end

  describe "#tv_season_videos", :vcr do
    let(:resource) { tmdb_rexx.tv_season_videos(id, season_number) }

    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.tv_season_videos(id, season_number)["results"].first }

      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("key") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("site") }
      it { expect(resource).to have_key("size") }
      it { expect(resource).to have_key("type") }
    end
  end
end
