require 'net/http'
require 'uri'
require 'json'

class ThemoviedbApiController < ApplicationController
  before_action :api_key, only: [:index, :talent, :talent_show]

  def index
    @title = "tmbd_api_index"
    uri = movie_list_select(params[:category])
    result = http_response_and_json_chenge(uri)
    @movies = result['results']
  end

  def talent
    unless params[:search].blank?
      key_word = URI::escape(params[:search])
      uri = "https://api.themoviedb.org/3/search/person?api_key=#{  @api_key  }&query=#{  key_word  }&page=1&include_adult=false"
      result = http_response_and_json_chenge(uri)
      @talents = result['results']
    end
  end

  def talent_show
    uri = "https://api.themoviedb.org/3/person/#{  params[:id]  }?language=en-US&api_key=#{  @api_key  }"
    @talent = http_response_and_json_chenge(uri)
  end

  private

    def api_key
      @api_key = 'bb5e93f78a09b099279afaad1fc4273d'
    end
end
