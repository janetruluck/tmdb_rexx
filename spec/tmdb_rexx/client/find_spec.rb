require "spec_helper"

# Find Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe "invalid external source" do
    it { expect{ tmdb_rexx.find("some-id", "invalid_source") }.to raise_error(TmdbRexx::InvalidExternalSourceError) }
  end

  describe ".find", :vcr do
    let(:resource) { tmdb_rexx.find("some-id", "imdb_id") }
    it { expect(resource).to have_key("movie_results") }
    it { expect(resource).to have_key("person_results") }
    it { expect(resource).to have_key("tv_results") }
    it { expect(resource).to have_key("tv_episode_results") }
    it { expect(resource).to have_key("tv_season_results") }

    context '["movie_results"]' do
      let(:resource) { tmdb_rexx.find("some-id", "imdb_id")["movie_results"].first }
      it { expect(resource).to have_key("adult") }
      it { expect(resource).to have_key("backdrop_path") }
      it { expect(resource).to have_key("genre_ids") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("original_language") }
      it { expect(resource).to have_key("original_title") }
      it { expect(resource).to have_key("overview") }
      it { expect(resource).to have_key("release_date") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("popularity") }
      it { expect(resource).to have_key("title") }
      it { expect(resource).to have_key("video") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end
  end
end
