require "spec_helper"

# Keyword Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".keyword", :vcr do
    context "type movies" do
      let(:resource) { tmdb_rexx.keyword("keyword-id") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end
  end

  describe ".keyword_movies", :vcr do
    let(:resource) { tmdb_rexx.keyword_movies("keyword-id") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.keyword_movies("keyword-id")["results"].first }
      it { expect(resource).to have_key("backdrop_path") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("original_title") }
      it { expect(resource).to have_key("release_date") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("title") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end
  end
end
