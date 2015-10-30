require "spec_helper"

# Changes Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".credits", :vcr do
    let(:resource) { tmdb_rexx.credits("credit-id") }
    it { expect(resource).to have_key("credit_type") }
    it { expect(resource).to have_key("department") }
    it { expect(resource).to have_key("job") }
    it { expect(resource).to have_key("media") }

    context "['media']" do
      let(:resource) { tmdb_rexx.credits("movie")["media"] }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("original_name") }
      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("episodes") }


      context "['episodes']" do
        let(:resource) { tmdb_rexx.credits("movie")["media"]["episodes"].first }
        it { expect(resource).to have_key("air_date") }
        it { expect(resource).to have_key("episode_number") }
        it { expect(resource).to have_key("name") }
        it { expect(resource).to have_key("overview") }
        it { expect(resource).to have_key("season_number") }
        it { expect(resource).to have_key("still_path") }
      end
    end
  end
end
