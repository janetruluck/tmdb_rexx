require "spec_helper"

# Movie Spec
describe TmdbRexx::Client do
  initialize_client

  let(:tmdb_rexx) { TmdbRexx::Client.new }
  let(:id) { "fight-club" }

  describe ".movie", :vcr do
    let(:resource) { tmdb_rexx.movie(id) }
    it { expect(resource).to have_key("adult") }
    it { expect(resource).to have_key("backdrop_path") }
    it { expect(resource).to have_key("belongs_to_collection") }
    it { expect(resource).to have_key("budget") }
    it { expect(resource).to have_key("genres") }
    it { expect(resource).to have_key("homepage") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("imdb_id") }
    it { expect(resource).to have_key("original_language") }
    it { expect(resource).to have_key("original_title") }
    it { expect(resource).to have_key("overview") }
    it { expect(resource).to have_key("popularity") }
    it { expect(resource).to have_key("poster_path") }
    it { expect(resource).to have_key("production_companies") }
    it { expect(resource).to have_key("production_countries") }
    it { expect(resource).to have_key("release_date") }
    it { expect(resource).to have_key("revenue") }
    it { expect(resource).to have_key("runtime") }
    it { expect(resource).to have_key("spoken_languages") }
    it { expect(resource).to have_key("status") }
    it { expect(resource).to have_key("tagline") }
    it { expect(resource).to have_key("title") }
    it { expect(resource).to have_key("video") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }
  end

  describe ".movie_alternative_titles", :vcr do
    let(:resource) { tmdb_rexx.movie_alternative_titles(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("titles") }

    context '["titles"]' do
      let(:resource) { tmdb_rexx.movie_alternative_titles(id)['titles'].first }
      it { expect(resource).to have_key("title") }
      it { expect(resource).to have_key("iso_3166_1") }
    end
  end

  describe ".movie_credits", :vcr do
    let(:resource) { tmdb_rexx.movie_credits(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("cast") }

    context '["cast"]' do
      let(:resource) { tmdb_rexx.movie_credits(id)["cast"].first }
      it { expect(resource).to have_key("cast_id") }
      it { expect(resource).to have_key("character") }
      it { expect(resource).to have_key("credit_id") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("order") }
      it { expect(resource).to have_key("profile_path") }
    end
  end

  describe ".movie_images", :vcr do
    let(:resource) { tmdb_rexx.movie_images(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("backdrops") }
    it { expect(resource).to have_key("posters") }

    context '["backdrops"]' do
      let(:resource) { tmdb_rexx.movie_images(id)["backdrops"].first }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("width") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end

    context '["posters"]' do
      let(:resource) { tmdb_rexx.movie_images(id)["posters"].first }
      it { expect(resource).to have_key("file_path") }
      it { expect(resource).to have_key("width") }
      it { expect(resource).to have_key("height") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("aspect_ratio") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end
  end

  describe ".movie_backdrops", :vcr do
    let(:resource) { tmdb_rexx.movie_backdrops(id).first }
    it { expect(resource).to have_key("file_path") }
    it { expect(resource).to have_key("width") }
    it { expect(resource).to have_key("height") }
    it { expect(resource).to have_key("iso_639_1") }
    it { expect(resource).to have_key("aspect_ratio") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }
  end

  describe ".movie_posters", :vcr do
    let(:resource) { tmdb_rexx.movie_posters(id).first }
    it { expect(resource).to have_key("file_path") }
    it { expect(resource).to have_key("width") }
    it { expect(resource).to have_key("height") }
    it { expect(resource).to have_key("iso_639_1") }
    it { expect(resource).to have_key("aspect_ratio") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }
  end

  describe ".movie_keywords", :vcr do
    let(:resource) { tmdb_rexx.movie_keywords(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("keywords") }

    context '["keywords"]' do
      let(:resource) { tmdb_rexx.movie_keywords(id)["keywords"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end
  end

  describe ".movie_releases", :vcr do
    let(:resource) { tmdb_rexx.movie_releases(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("countries") }

    context '["countries"]' do
      let(:resource) { tmdb_rexx.movie_releases(id)["countries"].first }
      it { expect(resource).to have_key("certification") }
      it { expect(resource).to have_key("iso_3166_1") }
      it { expect(resource).to have_key("primary") }
      it { expect(resource).to have_key("release_date") }
    end
  end

  describe ".movie_videos", :vcr do
    let(:resource) { tmdb_rexx.movie_videos(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.movie_videos(id)["results"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("key") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("site") }
      it { expect(resource).to have_key("size") }
      it { expect(resource).to have_key("type") }
    end
  end

  describe ".movie_translations", :vcr do
    let(:resource) { tmdb_rexx.movie_translations(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("translations") }

    context '["translations"]' do
      let(:resource) { tmdb_rexx.movie_translations(id)["translations"].first }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("english_name") }
    end
  end

  describe ".similar_movies", :vcr do
    let(:resource) { tmdb_rexx.similar_movies(id) }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.similar_movies(id)["results"].first }
      it { expect(resource).to have_key("adult") }
      it { expect(resource).to have_key("backdrop_path") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("original_title") }
      it { expect(resource).to have_key("release_date") }
      it { expect(resource).to have_key("poster_path") }
      it { expect(resource).to have_key("popularity") }
      it { expect(resource).to have_key("title") }
      it { expect(resource).to have_key("vote_average") }
      it { expect(resource).to have_key("vote_count") }
    end

  end

  describe ".movie_reviews", :vcr do
    let(:resource) { tmdb_rexx.movie_reviews(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.movie_reviews(id)["results"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("author") }
      it { expect(resource).to have_key("content") }
      it { expect(resource).to have_key("url") }
    end
  end

  describe ".movie_lists", :vcr do
    let(:resource) { tmdb_rexx.movie_lists(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.movie_lists(id)["results"].first }
      it { expect(resource).to have_key("description") }
      it { expect(resource).to have_key("favorite_count") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("item_count") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("poster_path") }
    end
  end

  describe ".movie_lists", :vcr do
    let(:resource) { tmdb_rexx.movie_lists(id) }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.movie_lists(id)["results"].first }
      it { expect(resource).to have_key("description") }
      it { expect(resource).to have_key("favorite_count") }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("item_count") }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("name") }
      it { expect(resource).to have_key("poster_path") }
    end
  end

  describe ".movie_changes", :vcr do
    let(:resource) { tmdb_rexx.movie_changes(id) }
    it { expect(resource).to have_key("changes") }

    context '["changes"]' do
      let(:resource) { tmdb_rexx.movie_changes(id)["changes"].first }
      it { expect(resource).to have_key("key") }
      it { expect(resource).to have_key("items") }

      context '["items"]' do
        let(:resource) { tmdb_rexx.movie_changes(id)["changes"].first["items"].first }
        it { expect(resource).to have_key("id") }
        it { expect(resource).to have_key("action") }
        it { expect(resource).to have_key("time") }
      end
    end
  end

  describe ".latest_movie", :vcr do
    let(:resource) { tmdb_rexx.latest_movie }
    it { expect(resource).to have_key("adult") }
    it { expect(resource).to have_key("backdrop_path") }
    it { expect(resource).to have_key("belongs_to_collection") }
    it { expect(resource).to have_key("budget") }
    it { expect(resource).to have_key("genres") }
    it { expect(resource).to have_key("homepage") }
    it { expect(resource).to have_key("id") }
    it { expect(resource).to have_key("imdb_id") }
    it { expect(resource).to have_key("original_title") }
    it { expect(resource).to have_key("overview") }
    it { expect(resource).to have_key("popularity") }
    it { expect(resource).to have_key("poster_path") }
    it { expect(resource).to have_key("production_companies") }
    it { expect(resource).to have_key("production_countries") }
    it { expect(resource).to have_key("release_date") }
    it { expect(resource).to have_key("revenue") }
    it { expect(resource).to have_key("runtime") }
    it { expect(resource).to have_key("spoken_languages") }
    it { expect(resource).to have_key("tagline") }
    it { expect(resource).to have_key("title") }
    it { expect(resource).to have_key("vote_average") }
    it { expect(resource).to have_key("vote_count") }

    context '["production_companies"]' do
      let(:resource) { tmdb_rexx.latest_movie["production_companies"].first }
      it { expect(resource).to have_key("id") }
      it { expect(resource).to have_key("name") }
    end

    context '["production_countries"]' do
      let(:resource) { tmdb_rexx.latest_movie['production_countries'].first }
      it { expect(resource).to have_key("iso_3166_1") }
      it { expect(resource).to have_key("name") }
    end

    context '["spoken_languages"]' do
      let(:resource) { tmdb_rexx.latest_movie['spoken_languages'].first }
      it { expect(resource).to have_key("iso_639_1") }
      it { expect(resource).to have_key("name") }
    end
  end

  describe ".now_playing", :vcr do
    let(:resource) { tmdb_rexx.now_playing }
    it { expect(resource).to have_key("dates") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.now_playing["results"].first }
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

  describe ".popular_movies", :vcr do
    let(:resource) { tmdb_rexx.popular_movies }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.popular_movies["results"].first }
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

  describe ".top_rated_movies", :vcr do
    let(:resource) { tmdb_rexx.top_rated_movies }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.top_rated_movies["results"].first }
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

  describe ".upcoming", :vcr do
    let(:resource) { tmdb_rexx.upcoming }
    it { expect(resource).to have_key("dates") }
    it { expect(resource).to have_key("page") }
    it { expect(resource).to have_key("results") }
    it { expect(resource).to have_key("total_pages") }
    it { expect(resource).to have_key("total_results") }

    context '["results"]' do
      let(:resource) { tmdb_rexx.upcoming["results"].first }
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
end
