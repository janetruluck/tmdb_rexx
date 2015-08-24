require "spec_helper"

# Job Spec
describe MovieRexx::Client do
  before do
    MovieRexx.reset!
    MovieRexx.configure do |c|
      c.base_url = "http://private-anon-d61b2e7fc-themoviedb.apiary-mock.com"
      c.api_key = "12345KEY"
    end
  end

  let(:movie_rexx) { MovieRexx::Client.new }

  describe ".jobs", :vcr do
    context "type movies" do
      let(:resource) { movie_rexx.jobs.first }
      it { expect(resource).to respond_to(:department) }
      it { expect(resource).to respond_to(:job_list) }
    end
  end
end
