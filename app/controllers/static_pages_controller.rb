class StaticPagesController < ApplicationController
  def home
    @all_ranks  = find_movie_best3_like_count # いいね数の多い投稿ベスト3
    @length = []
    like_best3_length(@length) # いいね数ベスト3の件数
    @movies = Movie.order('created_at desc').limit(12) # 最新投稿10選
  end

  def all_movies
    @movies = Movie.all.paginate(page: params[:page], per_page: 10)
    keyword_search(params[:keyword])
    category_search(params[:category])
    movies_order(params[:order])
    @movies = @movies.paginate(page: params[:page], per_page: 10)
  end
end
