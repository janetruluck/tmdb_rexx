require "spec_helper"

# Company Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".company", :vcr do
    let(:resource) { tmdb_rexx.company("company-id") }
    it { expect(resource).to respond_to(:description) }
    it { expect(resource).to respond_to(:headquarters) }
    it { expect(resource).to respond_to(:homepage) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:logo_path) }
    it { expect(resource).to respond_to(:name) }
    it { expect(resource).to respond_to(:parent_company) }
  end

  describe ".company_movies", :vcr do
    let(:resource) { tmdb_rexx.company_movies("company-id") }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { tmdb_rexx.company_movies("company-id").results.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:backdrop_path) }
      it { expect(resource).to respond_to(:original_title) }
      it { expect(resource).to respond_to(:release_date) }
      it { expect(resource).to respond_to(:poster_path) }
      it { expect(resource).to respond_to(:title) }
      it { expect(resource).to respond_to(:vote_average) }
      it { expect(resource).to respond_to(:vote_count) }
    end
  end
end
