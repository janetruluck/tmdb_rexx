require "spec_helper"

# Changes Spec
describe MovieRexx::Client do
  before do
    MovieRexx.reset!
    MovieRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:movie_rexx) { MovieRexx::Client.new }

  describe "invalid type" do
    it { expect{ movie_rexx.changes("invalid") }.to raise_error(MovieRexx::InvalidTypeError) }
  end

  describe ".changes", :vcr do
    let(:resource) { movie_rexx.changes("movie") }
    it { expect(resource).to respond_to(:results) }
    it { expect(resource).to respond_to(:page) }
    it { expect(resource).to respond_to(:total_pages) }
    it { expect(resource).to respond_to(:total_results) }

    context ".results" do
      let(:resource) { movie_rexx.changes("movie").results.first }
      it { expect(resource).to respond_to(:id) }
      it { expect(resource).to respond_to(:adult) }
    end
  end
end
