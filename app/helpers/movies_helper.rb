module MoviesHelper
  def spoiler_comment(movie)
    if movie.spoiler == true
      "(※ネタバレあり)"
    else
      "(※ネタバレなし)"
    end
  end

  def find_movie_best3_like_count
    Movie.find(Like.group(:movie_id).order('count(movie_id) desc').limit(3).pluck(:movie_id))
  end

  def like_best3_length(length)
    all_ranks = find_movie_best3_like_count
    all_ranks.each.with_index(0) do |rank, i|
      length[i] = Like.where(movie_id: rank.id).length
    end
  end
end
