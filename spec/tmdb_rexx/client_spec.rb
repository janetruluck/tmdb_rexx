require "spec_helper"

# Client Spec
describe TmdbRexx::Client do
  before { TmdbRexx.reset! }

  describe "#initialize" do
    context "without an API key" do
      it "can not be initialized" do
        expect{ TmdbRexx::Client.new.class }.to raise_error(TmdbRexx::MissingAPIKeyError)
      end
    end

    context "without parameters" do
      let(:api_key){ "12345KEY" }

      before do
        TmdbRexx.reset!
        TmdbRexx.configure do |c|
          c.api_key = api_key
        end
      end

      it "can be initialized" do
        expect(TmdbRexx::Client.new.class).to eq(TmdbRexx::Client)
      end

      it "is aliased within itself" do
        expect(TmdbRexx.new.class).to eq(TmdbRexx::Client)
      end

      it{ expect(TmdbRexx.api_key).to eq(api_key) }
      it{ expect(TmdbRexx.base_url).to eq(TmdbRexx::Default::BASE_URL) }
      it{ expect(TmdbRexx.version).to eq(TmdbRexx::Default::VERSION) }
      it{ expect(TmdbRexx.include_adult).to eq(TmdbRexx::Default::INCLUDE_ADULT) }
      it{ expect(TmdbRexx.language).to eq(TmdbRexx::Default::LANGUAGE) }
      it{ expect(TmdbRexx::Client.new.api_endpoint).to eq("#{TmdbRexx::Default::BASE_URL}/#{TmdbRexx::Default::VERSION}") }
    end

    context "with specified parameters" do
      let(:api_key){ "12345KEY" }
      let(:base_url){ "http://www.google.com" }
      let(:version){ 3 }
      let(:include_adult){ true }
      let(:language){ "en" }

      before do
        TmdbRexx.configure do |c|
          c.api_key = api_key
          c.base_url = base_url
          c.version = version
          c.include_adult = include_adult
          c.language = language
        end
      end

      it "can be initialized" do
        expect(TmdbRexx::Client.new.class).to eq(TmdbRexx::Client)
      end

      it "is aliased within itself" do
        expect(TmdbRexx.new.class).to eq(TmdbRexx::Client)
      end

      it{ expect(TmdbRexx.api_key).to eq(api_key) }
      it{ expect(TmdbRexx.base_url).to eq(base_url) }
      it{ expect(TmdbRexx.version).to eq(version) }
      it{ expect(TmdbRexx.include_adult).to eq(include_adult) }
      it{ expect(TmdbRexx.language).to eq(language) }
      it{ expect(TmdbRexx::Client.new.api_endpoint).to eq("#{base_url}/#{version}") }
    end

    context "with specified parameters through new" do
      let(:api_key){ "12345KEY" }
      let(:base_url){ "http://www.google.com" }
      let(:version){ 4 }
      let(:include_adult){ true }
      let(:language){ "fr" }

      let(:client) {
        TmdbRexx.new(
          api_key: api_key,
          base_url: base_url,
          version: version,
          include_adult: include_adult,
          language: language
        )
      }

      it "can be initialized" do
        expect(client.class).to eq(TmdbRexx::Client)
      end

      it{ expect(client.instance_variable_get(:@api_key)).to eq(api_key) }
      it{ expect(client.instance_variable_get(:@base_url)).to eq(base_url) }
      it{ expect(client.instance_variable_get(:@version)).to eq(version) }
      it{ expect(client.instance_variable_get(:@include_adult)).to eq(include_adult) }
      it{ expect(client.instance_variable_get(:@language)).to eq(language) }
      it{ expect(client.api_endpoint).to eq("#{base_url}/#{version}") }
    end
  end
end
