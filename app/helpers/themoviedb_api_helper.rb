module ThemoviedbApiHelper


  def movie_list_select(list)
    if "now_playing"  == list
      @list = "上映中映画一覧"
      "https://api.themoviedb.org/3/movie/now_playing?api_key=#{ @api_key }&page=1"
    elsif "top_rated" == list
      @list = "高評価順映画一覧"
      "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ @api_key }&page=1"
    elsif "upcoming"  == list
      @list = "上映予定映画一覧"
      "https://api.themoviedb.org/3/movie/upcoming?api_key=#{ @api_key }&page=1"
    else
      @list = "人気順映画一覧"
      "https://api.themoviedb.org/3/movie/popular?api_key=#{ @api_key }&page=1"
    end
  end

  # HTTPリクエスト
  def http_response(uri)
    Net::HTTP.get(URI.parse(uri))
  end

  # JSONをハッシュに変換
  def http_response_and_json_chenge(uri)
    json = http_response(uri)
    JSON.parse(json)
  end

  def profile_image(image)
    if image.blank?
      "/images/dummy.png"
    else
      "//image.tmdb.org/t/p/w440_and_h660_face/#{  image  }"
    end
  end
end
