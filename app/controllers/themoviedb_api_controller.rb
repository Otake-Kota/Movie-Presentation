require 'net/http'
require 'uri'
require 'json'

class ThemoviedbApiController < ApplicationController

  def index
    @title = "tmbd_api_index"
    api_key = 'bb5e93f78a09b099279afaad1fc4273d'
    if "now_playing"  == params[:category]
      uri = "https://api.themoviedb.org/3/movie/now_playing?api_key=#{ api_key }&page=1"
      @list = "上映中映画一覧"
    elsif "top_rated" == params[:category]
      uri = "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ api_key }&page=1"
      @list = "高評価順映画一覧"
    elsif "upcoming"  == params[:category]
      uri = "https://api.themoviedb.org/3/movie/upcoming?api_key=#{ api_key }&page=1"
      @list = "上映予定映画一覧"
    else
      uri = "https://api.themoviedb.org/3/movie/popular?api_key=#{ api_key }&page=1"
      @list = "人気順映画一覧"
    end
    json = Net::HTTP.get(URI.parse(uri))
    result = JSON.parse(json)
    @movies = result['results']
  end
end
