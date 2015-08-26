require "spec_helper"

# Certification Spec
describe TmdbRexx::Client do
  before do
    TmdbRexx.reset!
    TmdbRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".certifications", :vcr do
    context "type movies" do
      let(:resource) { tmdb_rexx.certifications }

      it "responds to a country code" do
        expect(resource).to respond_to(:AU)
        expect(resource).to respond_to(:US)
      end

      context "within a country" do
        let(:resource) { tmdb_rexx.certifications.values.first.first }

        it { expect(resource).to respond_to(:certification) }
        it { expect(resource).to respond_to(:meaning) }
        it { expect(resource).to respond_to(:order) }
      end
    end

    context "type tv" do
      let(:resource) { tmdb_rexx.certifications("tv") }

      it "responds to a country code" do
        expect(resource).to respond_to(:AU)
        expect(resource).to respond_to(:US)
      end

      context "within a country" do
        let(:resource) { tmdb_rexx.certifications("tv").values.first.first }

        it { expect(resource).to respond_to(:certification) }
        it { expect(resource).to respond_to(:meaning) }
        it { expect(resource).to respond_to(:order) }
      end
    end
  end
end
