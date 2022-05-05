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
      wows = connection.get("random", { results: results }).body
      wows.map { |wow| OwenWows::Wow.new(wow) }
    end

    def with_director(director)
      wows = connection.get("random", { director: director }).body
      wows.map { |wow| OwenWows::Wow.new(wow) }
    end

    def in_movie(movie, exact: true, results: CURRENT_MOVIE_COUNT)
      wows = connection.get("random", { movie: movie, results: results }).body
      all = wows.map { |wow| OwenWows::Wow.new(wow) }
      return all unless exact

      all.select { |wow| wow["movie"] == movie }
    end

    def all_movies
      connection.get("movies").body
    end

    def all_directors
      connection.get("directors").body
    end
  end
end