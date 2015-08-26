require "spec_helper"

# Changes Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".credits", :vcr do
    let(:resource) { tmdb_rexx.credits("credit-id") }
    it { expect(resource).to respond_to(:credit_type) }
    it { expect(resource).to respond_to(:department) }
    it { expect(resource).to respond_to(:job) }
    it { expect(resource).to respond_to(:media) }

    context ".media" do
      let(:resource) { tmdb_rexx.credits("movie").media }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:name) }
      it { expect(resource).to respond_to(:original_name) }
      it { expect(resource).to respond_to(:character) }
      it { expect(resource).to respond_to(:episodes) }


      context ".episodes" do
        let(:resource) { tmdb_rexx.credits("movie").media.episodes.first }
        it { expect(resource).to respond_to(:air_date) }
        it { expect(resource).to respond_to(:episode_number) }
        it { expect(resource).to respond_to(:name) }
        it { expect(resource).to respond_to(:overview) }
        it { expect(resource).to respond_to(:season_number) }
        it { expect(resource).to respond_to(:still_path) }
      end
    end
  end
end
