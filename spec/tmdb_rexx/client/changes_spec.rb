require "spec_helper"

# Changes Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe "invalid type" do
    it { expect{ tmdb_rexx.changes("invalid") }.to raise_error(TmdbRexx::InvalidTypeError) }
  end

  describe ".changes", :vcr do
    let(:resource) { tmdb_rexx.changes("movie") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.changes("movie")["results"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("adult") }
    end
  end
end
