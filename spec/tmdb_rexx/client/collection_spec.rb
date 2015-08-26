require "spec_helper"

# Collection Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".collection", :vcr do
    let(:resource) { tmdb_rexx.collection("collection-id") }
    it { expect(resource).to respond_to(:backdrop_path) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:name) }
    it { expect(resource).to respond_to(:parts) }
    it { expect(resource).to respond_to(:poster_path) }

    context ".parts" do
      let(:resource) { tmdb_rexx.collection("collection-id").parts.first }
      it { expect(resource).to respond_to(:backdrop_path) }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:release_date) }
      it { expect(resource).to respond_to(:title) }
      it { expect(resource).to respond_to(:poster_path) }
    end
  end

  describe ".collection_images", :vcr do
    let(:resource) { tmdb_rexx.collection_images("collection-id") }
    it { expect(resource).to respond_to(:backdrops) }
    it { expect(resource).to respond_to(:id) }
    it { expect(resource).to respond_to(:posters) }

    context ".backdrops" do
      let(:resource) { tmdb_rexx.collection_images("collection-id").backdrops.first }
      it { expect(resource).to respond_to(:aspect_ratio) }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:width) }
    end

    context ".posters" do
      let(:resource) { tmdb_rexx.collection_images("collection-id").posters.first }
      it { expect(resource).to respond_to(:aspect_ratio) }
      it { expect(resource).to respond_to(:file_path) }
      it { expect(resource).to respond_to(:height) }
      it { expect(resource).to respond_to(:iso_639_1) }
      it { expect(resource).to respond_to(:width) }
    end
  end
end
