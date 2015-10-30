require "spec_helper"

# Job Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".jobs", :vcr do
    context "type movies" do
      let(:resource) { tmdb_rexx.jobs.first }
      it { expect(resource).to have_key("department") }
      it { expect(resource).to have_key("job_list") }
    end
  end
end
