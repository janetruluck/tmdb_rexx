require "spec_helper"

# Company Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".company", :vcr do
    let(:resource) { tmdb_rexx.company("company-id") }
    it { expect(resource).to have_key("description") }
    it { expect(resource).to have_key("headquarters") }
    it { expect(resource).to have_key("homepage") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("logo_path") }
    it { expect(resource).to have_key("name") }
    it { expect(resource).to have_key("parent_company") }
  end

  describe ".company_movies", :vcr do
    let(:resource) { tmdb_rexx.company_movies("company-id") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.company_movies("company-id")["results"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("backdrop_path") }
      it { expect(resource).to have_key("original_title") }
      it { expect(resource).to have_key("release_date") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("title") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end
  end
end
