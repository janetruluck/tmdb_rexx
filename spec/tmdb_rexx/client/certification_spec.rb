require "spec_helper"

# Certification Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".certifications", :vcr do
    context "type movies" do
      let(:resource) { tmdb_rexx.certifications }

      it "responds to a country code" do
        expect(resource).to have_key("AU")
        expect(resource).to have_key("US")
      end

      context "within a country" do
        let(:resource) { tmdb_rexx.certifications.values.first.first }

        it { expect(resource).to have_key("certification") }
        it { expect(resource).to have_key("meaning") }
        it { expect(resource).to have_key("order") }
      end
    end

    context "type tv" do
      let(:resource) { tmdb_rexx.certifications("tv") }

      it "responds to a country code" do
        expect(resource).to have_key("AU")
        expect(resource).to have_key("US")
      end

      context "within a country" do
        let(:resource) { tmdb_rexx.certifications("tv").values.first.first }

        it { expect(resource).to have_key("certification") }
        it { expect(resource).to have_key("meaning") }
        it { expect(resource).to have_key("order") }
      end
    end
  end
end
