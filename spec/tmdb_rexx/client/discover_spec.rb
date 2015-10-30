require "spec_helper"

# Discover Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".discover", :vcr do
    context "movie" do
      let(:resource) { tmdb_rexx.discover("movie", { primary_release_year: 2015 }) }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.discover("movie", { primary_release_year: 2015 })["results"].first }
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

    context "tv" do
      let(:resource) { tmdb_rexx.discover("tv", { "first_air_date.lte" => "2015-01-01" }) }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.discover("tv", { "first_air_date.lte" => "2015-01-01" })["results"].first }
        it { expect(resource).to have_key("backdrop_path") }
        it { expect(resource).to have_key("first_air_date") }
        it { expect(resource).to have_key("genre_ids") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("original_language") }
        it { expect(resource).to have_key("original_name") }
        it { expect(resource).to have_key("overview") }
        it { expect(resource).to have_key("origin_country") }
        it { expect(resource).to have_key("poster_path") }
        it { expect(resource).to have_key("popularity") }
        it { expect(resource).to have_key("name") }
        it { expect(resource).to have_key("vote_average") }
        it { expect(resource).to have_key("vote_count") }
      end
    end
  end
end
