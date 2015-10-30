require "spec_helper"

# Search Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }

  describe ".search", :vcr do
    context "company" do
      let(:type) { "company" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first}
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("logo_path") }
        it { expect(resource).to have_key("name") }
      end
    end

    context "collection" do
      let(:type) { "collection" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first}
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("backdrop_path") }
        it { expect(resource).to have_key("name") }
        it { expect(resource).to have_key("poster_path") }
      end
    end

    context "keyword" do
      let(:type) { "keyword" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first}
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("name") }
      end
    end

    context "list" do
      let(:type) { "list" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first}
        it { expect(resource).to have_key("description") }
        it { expect(resource).to have_key("favorite_count") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("item_count") }
        it { expect(resource).to have_key("iso_639_1") }
        it { expect(resource).to have_key("list_type") }
        it { expect(resource).to have_key("name") }
        it { expect(resource).to have_key("poster_path") }
      end
    end

    context "movie" do
      let(:type) { "movie" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first}
        it { expect(resource).to have_key("adult") }
        it { expect(resource).to have_key("backdrop_path") }
        it { expect(resource).to have_key("genre_ids") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("original_language") }
        it { expect(resource).to have_key("original_title") }
        it { expect(resource).to have_key("overview") }
        it { expect(resource).to have_key("release_date") }
        it { expect(resource).to have_key("poster_path") }
        it { expect(resource).to have_key("popularity") }
        it { expect(resource).to have_key("title") }
        it { expect(resource).to have_key("video") }
        it { expect(resource).to have_key("vote_average") }
        it { expect(resource).to have_key("vote_count") }
      end
    end

    context "multi" do
      let(:type) { "multi" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first}
        it { expect(resource).to have_key("backdrop_path") }
        it { expect(resource).to have_key("first_air_date") }
        it { expect(resource).to have_key("genre_ids") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("original_language") }
        it { expect(resource).to have_key("original_name") }
        it { expect(resource).to have_key("overview") }
        it { expect(resource).to have_key("origin_country") }
        it { expect(resource).to have_key("poster_path") }
        it { expect(resource).to have_key("popularity") }
        it { expect(resource).to have_key("name") }
        it { expect(resource).to have_key("vote_average") }
        it { expect(resource).to have_key("vote_count") }
        it { expect(resource).to have_key("media_type") }
      end
    end

    context "person" do
      let(:type) { "person" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first}
        it { expect(resource).to have_key("adult") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("known_for") }
        it { expect(resource).to have_key("name") }
        it { expect(resource).to have_key("popularity") }
        it { expect(resource).to have_key("profile_path") }

        context '["known_for"]' do
          let(:resource) { tmdb_rexx.search(type, query)["results"].first["known_for"].first }
          it { expect(resource).to have_key("adult") }
          it { expect(resource).to have_key("backdrop_path") }
          it { expect(resource).to have_key("genre_ids") }
          it { expect(resource).to have_key("id") }
          it { expect(resource).to have_key("original_language") }
          it { expect(resource).to have_key("original_title") }
          it { expect(resource).to have_key("overview") }
          it { expect(resource).to have_key("release_date") }
          it { expect(resource).to have_key("poster_path") }
          it { expect(resource).to have_key("popularity") }
          it { expect(resource).to have_key("title") }
          it { expect(resource).to have_key("video") }
          it { expect(resource).to have_key("vote_average") }
          it { expect(resource).to have_key("vote_count") }
          it { expect(resource).to have_key("media_type") }
        end
      end
    end

    context "tv" do
      let(:type) { "tv" }
      let(:query) { "fight-club" }
      let(:resource) { tmdb_rexx.search(type, query) }

      it { expect(resource).to have_key("page") }
      it { expect(resource).to have_key("results") }
      it { expect(resource).to have_key("total_pages") }
      it { expect(resource).to have_key("total_results") }

      context '["results"]' do
        let(:resource) { tmdb_rexx.search(type, query)["results"].first }
        it { expect(resource).to have_key("backdrop_path") }
        it { expect(resource).to have_key("first_air_date") }
        it { expect(resource).to have_key("genre_ids") }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("original_language") }
        it { expect(resource).to have_key("original_name") }
        it { expect(resource).to have_key("overview") }
        it { expect(resource).to have_key("origin_country") }
        it { expect(resource).to have_key("poster_path") }
        it { expect(resource).to have_key("popularity") }
        it { expect(resource).to have_key("name") }
        it { expect(resource).to have_key("vote_average") }
        it { expect(resource).to have_key("vote_count") }
      end
    end
  end
end
