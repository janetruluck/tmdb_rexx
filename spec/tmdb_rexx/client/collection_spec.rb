require "spec_helper"

# Collection Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".collection", :vcr do
    let(:resource) { tmdb_rexx.collection("collection-id") }
    it { expect(resource).to have_key("backdrop_path") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("name") }
    it { expect(resource).to have_key("parts") }
    it { expect(resource).to have_key("poster_path") }

    context '["parts"]' do
      let(:resource) { tmdb_rexx.collection("collection-id")["parts"].first }
      it { expect(resource).to have_key("backdrop_path") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("release_date") }
      it { expect(resource).to have_key("title") }
      it { expect(resource).to have_key("poster_path") }
    end
  end

  describe ".collection_images", :vcr do
    let(:resource) { tmdb_rexx.collection_images("collection-id") }
    it { expect(resource).to have_key("backdrops") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("posters") }

    context '["backdrops"]' do
      let(:resource) { tmdb_rexx.collection_images("collection-id")["backdrops"].first }
      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("width") }
    end

    context '["posters"]' do
      let(:resource) { tmdb_rexx.collection_images("collection-id")["posters"].first }
      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("width") }
    end
  end
end
