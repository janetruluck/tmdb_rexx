require "spec_helper"

# TV Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }
  let(:id) { "breaking-bad" }

  describe ".tv", :vcr do
    let(:resource) { tmdb_rexx.tv(id) }
    it { expect(resource).to have_key("backdrop_path") }
    it { expect(resource).to have_key("created_by") }
    it { expect(resource).to have_key("episode_run_time") }
    it { expect(resource).to have_key("first_air_date") }
    it { expect(resource).to have_key("genres") }
    it { expect(resource).to have_key("homepage") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("in_production") }
    it { expect(resource).to have_key("languages") }
    it { expect(resource).to have_key("last_air_date") }
    it { expect(resource).to have_key("name") }
    it { expect(resource).to have_key("networks") }
    it { expect(resource).to have_key("number_of_episodes") }
    it { expect(resource).to have_key("number_of_seasons") }
    it { expect(resource).to have_key("origin_country") }
    it { expect(resource).to have_key("original_language") }
    it { expect(resource).to have_key("original_name") }
    it { expect(resource).to have_key("overview") }
    it { expect(resource).to have_key("popularity") }
    it { expect(resource).to have_key("poster_path") }
    it { expect(resource).to have_key("production_companies") }
    it { expect(resource).to have_key("seasons") }
    it { expect(resource).to have_key("status") }
    it { expect(resource).to have_key("type") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }
    context '["created_by"]' do
      let(:resource) { tmdb_rexx.tv(id)["created_by"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("profile_path") }
    end
    context '["genres"]' do
      let(:resource) { tmdb_rexx.tv(id)["genres"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end
    context '["networks"]' do
      let(:resource) { tmdb_rexx.tv(id)["networks"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end
    context '["production_companies"]' do
      let(:resource) { tmdb_rexx.tv(id)["production_companies"].first }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("id") }
    end
    context '["seasons"]' do
      let(:resource) { tmdb_rexx.tv(id)["seasons"].first }
      it { expect(resource).to have_key("air_date") }
      it { expect(resource).to have_key("episode_count") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("season_number") }
    end
  end

  describe ".tv_account_states", :vcr do
    let(:resource) { tmdb_rexx.tv_account_states(id) }
    xit { expect(resource).to have_key("id") }
    xit { expect(resource).to have_key("favorite") }
    xit { expect(resource).to have_key("rated") }
    xit { expect(resource).to have_key("watchlist") }
    context '["titles"]' do
      let(:resource) { tmdb_rexx.movie_alternative_titles(id).rated.first }
      xit { expect(resource).to have_key("value") }
    end
  end

  describe ".tv_alternative_titles", :vcr do
    let(:resource) { tmdb_rexx.tv_alternative_titles(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("results") }
    context '["results"]' do
      let(:resource) { tmdb_rexx.tv_alternative_titles(id)["results"].first }
      it { expect(resource).to have_key("title") }
      it { expect(resource).to have_key("iso_3166_1") }
    end
  end

  describe ".tv_changes", :vcr do
    let(:resource) { tmdb_rexx.tv_changes(id) }
    it { expect(resource).to have_key("changes") }

    context '["changes"]' do
      let(:resource) { tmdb_rexx.tv_changes(id)["changes"].first }
      it { expect(resource).to have_key("key") }
      it { expect(resource).to have_key("items") }

      context '["items"]' do
        let(:resource) { tmdb_rexx.tv_changes(id)["changes"].first["items"].first }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("action") }
        it { expect(resource).to have_key("time") }
        it { expect(resource).to have_key("value") }
      end
    end
  end

  describe ".tv_content_ratings", :vcr do
    let(:resource) { tmdb_rexx.tv_content_ratings(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.tv_content_ratings(id)["results"].first }
      it { expect(resource).to have_key("iso_3166_1") }
      it { expect(resource).to have_key("rating") }
    end
  end

  describe ".tv_credits", :vcr do
    let(:resource) { tmdb_rexx.tv_credits(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("cast") }
    it { expect(resource).to have_key("crew") }

    context '["cast"]' do
      let(:resource) { tmdb_rexx.tv_credits(id)["cast"].first }
      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("order") }
      it { expect(resource).to have_key("profile_path") }
    end

    context '["crew"]' do
      let(:resource) { tmdb_rexx.tv_credits(id)["crew"].first }
      it { expect(resource).to have_key("department") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("job") }
      it { expect(resource).to have_key("profile_path") }
    end
  end

  describe ".tv_external_ids", :vcr do
    let(:resource) { tmdb_rexx.tv_external_ids(id) }
    it { expect(resource).to have_key("imdb_id") }
    it { expect(resource).to have_key("freebase_id") }
    it { expect(resource).to have_key("freebase_mid") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("tvdb_id") }
    it { expect(resource).to have_key("tvrage_id") }
  end

  describe ".tv_images", :vcr do
    let(:resource) { tmdb_rexx.tv_images(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("backdrops") }
    it { expect(resource).to have_key("posters") }

    context '["backdrops"]' do
      let(:resource) { tmdb_rexx.tv_images(id)["backdrops"].first }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("width") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end

    context '["posters"]' do
      let(:resource) { tmdb_rexx.tv_images(id)["posters"].first }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("width") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end
  end

  describe ".tv_backdrops", :vcr do
    let(:resource) { tmdb_rexx.tv_backdrops(id).first }
    it { expect(resource).to have_key("file_path") }
    it { expect(resource).to have_key("width") }
    it { expect(resource).to have_key("height") }
    it { expect(resource).to have_key("iso_639_1") }
    it { expect(resource).to have_key("aspect_ratio") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }
  end

  describe ".tv_posters", :vcr do
    let(:resource) { tmdb_rexx.tv_posters(id).first }
    it { expect(resource).to have_key("file_path") }
    it { expect(resource).to have_key("width") }
    it { expect(resource).to have_key("height") }
    it { expect(resource).to have_key("iso_639_1") }
    it { expect(resource).to have_key("aspect_ratio") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }
  end

  describe ".tv_keywords", :vcr do
    let(:resource) { tmdb_rexx.tv_keywords(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.tv_keywords(id)["results"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end
  end

  describe ".similar_tvs", :vcr do
    let(:resource) { tmdb_rexx.similar_tvs(id) }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.similar_tvs(id)["results"].first }
      it { expect(resource).to have_key("backdrop_path") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("original_name") }
      it { expect(resource).to have_key("first_air_date") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("popularity") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end
  end

  describe ".tv_translations", :vcr do
    let(:resource) { tmdb_rexx.tv_translations(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("translations") }

    context '["translations"]' do
      let(:resource) { tmdb_rexx.tv_translations(id)["translations"].first }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("english_name") }
    end
  end

  describe ".tv_videos", :vcr do
    let(:resource) { tmdb_rexx.tv_videos(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.tv_videos(id)["results"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("key") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("site") }
      it { expect(resource).to have_key("size") }
      it { expect(resource).to have_key("type") }
    end
  end

  describe ".latest_tv", :vcr do
    let(:resource) { tmdb_rexx.latest_tv(id) }
    it { expect(resource).to have_key("backdrop_path") }
    it { expect(resource).to have_key("created_by") }
    it { expect(resource).to have_key("episode_run_time") }
    it { expect(resource).to have_key("first_air_date") }
    it { expect(resource).to have_key("genres") }
    it { expect(resource).to have_key("homepage") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("in_production") }
    it { expect(resource).to have_key("languages") }
    it { expect(resource).to have_key("last_air_date") }
    it { expect(resource).to have_key("name") }
    it { expect(resource).to have_key("networks") }
    it { expect(resource).to have_key("number_of_episodes") }
    it { expect(resource).to have_key("number_of_seasons") }
    it { expect(resource).to have_key("origin_country") }
    it { expect(resource).to have_key("original_name") }
    it { expect(resource).to have_key("overview") }
    it { expect(resource).to have_key("popularity") }
    it { expect(resource).to have_key("poster_path") }
    it { expect(resource).to have_key("seasons") }
    it { expect(resource).to have_key("status") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }
    context '["created_by"]' do
      let(:resource) { tmdb_rexx.latest_tv(id)["created_by"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("profile_path") }
    end
    context '["genres"]' do
      let(:resource) { tmdb_rexx.latest_tv(id)["genres"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end
    context '["networks"]' do
      let(:resource) { tmdb_rexx.latest_tv(id)["networks"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end
    context '["seasons"]' do
      let(:resource) { tmdb_rexx.tv(id)["seasons"].first }
      it { expect(resource).to have_key("air_date") }
      it { expect(resource).to have_key("episode_count") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("season_number") }
    end
  end

  describe ".on_the_air_tv", :vcr do
    let(:resource) { tmdb_rexx.on_the_air_tv(id) }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }
    context '["results"]' do
      let(:resource) { tmdb_rexx.on_the_air_tv(id)["results"].first }
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

  describe ".airing_today_tv", :vcr do
    let(:resource) { tmdb_rexx.airing_today_tv(id) }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }
    context '["results"]' do
      let(:resource) { tmdb_rexx.airing_today_tv(id)["results"].first }
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

  describe ".top_rated_tv", :vcr do
    let(:resource) { tmdb_rexx.top_rated_tv(id) }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }
    context '["results"]' do
      let(:resource) { tmdb_rexx.top_rated_tv(id)["results"].first }
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

  describe ".popular_tv", :vcr do
    let(:resource) { tmdb_rexx.popular_tv(id) }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }
    context '["results"]' do
      let(:resource) { tmdb_rexx.popular_tv(id)["results"].first }
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
