# frozen_string_literal: true

require "faraday"
require "owen_wows/wow"
module OwenWows
  class Client
    BASE_URL = "https://owen-wilson-wow-api.herokuapp.com/wows/"
    CURRENT_MOVIE_COUNT = 91
    attr_reader :adapter

    def initialize(adapter: Faraday.default_adapter)
      @adapter = adapter
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = BASE_URL
        conn.request :json
        conn.response :json, content_type: "application/json"
        conn.adapter adapter
      end
    end

    def list(results: CURRENT_MOVIE_COUNT)
      wows = search(results: results)
      build_list(wows)
    end

    def with_director(director, results: CURRENT_MOVIE_COUNT)
      wows = search(director: director, results: results)
      build_list(wows)
    end

    def from_year(year, results: CURRENT_MOVIE_COUNT)
      wows = search(year: year, results: results)
      build_list(wows)
    end

    def in_movie(movie, exact: true, results: CURRENT_MOVIE_COUNT)
      wows = search(movie: movie, results: results)
      all = build_list(wows)
      return all unless exact

      all.select { |wow| wow["movie"] == movie }
    end

    def search(**kwargs)
      wows = connection.get("random", **kwargs).body
      build_list(wows)
    end

    def all_movies
      connection.get("movies").body
    end

    def all_directors
      connection.get("directors").body
    end

    private

    def build_list(wows)
      wows.map { |wow| OwenWows::Wow.new(wow) }
    end
  end
end