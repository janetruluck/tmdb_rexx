require "spec_helper"

# Client Spec
describe MovieRexx::Client do
  before { MovieRexx.reset! }

  describe "#initialize" do
    context "without an API key" do
      it "can not be initialized" do
        expect{ MovieRexx::Client.new.class }.to raise_error(MovieRexx::MissingAPIKeyError)
      end
    end

    context "without parameters" do
      let(:api_key){ "12345KEY" }

      before do
        MovieRexx.reset!
        MovieRexx.configure do |c|
          c.api_key = api_key
        end
      end

      it "can be initialized" do
        expect(MovieRexx::Client.new.class).to eq(MovieRexx::Client)
      end

      it "is aliased within itself" do
        expect(MovieRexx.new.class).to eq(MovieRexx::Client)
      end

      it{ expect(MovieRexx.api_key).to eq(api_key) }
      it{ expect(MovieRexx.base_url).to eq(MovieRexx::Default::BASE_URL) }
      it{ expect(MovieRexx.version).to eq(MovieRexx::Default::VERSION) }
      it{ expect(MovieRexx.include_adult).to eq(MovieRexx::Default::INCLUDE_ADULT) }
      it{ expect(MovieRexx.language).to eq(MovieRexx::Default::LANGUAGE) }
      it{ expect(MovieRexx::Client.new.api_endpoint).to eq("#{MovieRexx::Default::BASE_URL}/#{MovieRexx::Default::VERSION}") }
    end

    context "with specified parameters" do
      let(:api_key){ "12345KEY" }
      let(:base_url){ "http://www.google.com" }
      let(:version){ 3 }
      let(:include_adult){ true }
      let(:language){ "en" }

      before do
        MovieRexx.configure do |c|
          c.api_key = api_key
          c.base_url = base_url
          c.version = version
          c.include_adult = include_adult
          c.language = language
        end
      end

      it "can be initialized" do
        expect(MovieRexx::Client.new.class).to eq(MovieRexx::Client)
      end

      it "is aliased within itself" do
        expect(MovieRexx.new.class).to eq(MovieRexx::Client)
      end

      it{ expect(MovieRexx.api_key).to eq(api_key) }
      it{ expect(MovieRexx.base_url).to eq(base_url) }
      it{ expect(MovieRexx.version).to eq(version) }
      it{ expect(MovieRexx.include_adult).to eq(include_adult) }
      it{ expect(MovieRexx.language).to eq(language) }
      it{ expect(MovieRexx::Client.new.api_endpoint).to eq("#{base_url}/#{version}") }
    end

    context "with specified parameters through new" do
      let(:api_key){ "12345KEY" }
      let(:base_url){ "http://www.google.com" }
      let(:version){ 4 }
      let(:include_adult){ true }
      let(:language){ "fr" }

      let(:client) {
        MovieRexx.new(
          api_key: api_key,
          base_url: base_url,
          version: version,
          include_adult: include_adult,
          language: language
        )
      }

      it "can be initialized" do
        expect(client.class).to eq(MovieRexx::Client)
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
