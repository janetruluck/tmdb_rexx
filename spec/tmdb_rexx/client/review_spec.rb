require "spec_helper"

# Review Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".review", :vcr do
    let(:resource) { tmdb_rexx.review("review-id") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("author") }
    it { expect(resource).to have_key("content") }
    it { expect(resource).to have_key("iso_639_1") }
    it { expect(resource).to have_key("media_id") }
    it { expect(resource).to have_key("media_title") }
    it { expect(resource).to have_key("media_type") }
    it { expect(resource).to have_key("url") }
  end
end
