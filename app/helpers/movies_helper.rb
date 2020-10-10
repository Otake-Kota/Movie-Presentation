module MoviesHelper
  def spoiler_comment(movie)
    if movie.spoiler == true
      "※ネタバレあり"
    else
      "※ネタバレなし"
    end
  end
end
