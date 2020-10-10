class MoviesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy, :show, :comment_create, :comment_destroy]
  before_action :correct_user,   only: [:destroy]
  before_action :movie_comment_correct_user, only: [:comment_destroy]

  def show
    @movie = Movie.find(params[:id])
    @user = User.find(@movie.user_id)
    @movie_comment = @movie.movie_comments.build
    @feed_items = @movie.feed.paginate(page: params[:page], per_page: 5)
  end

  def new
    @movie = current_user.movies.build
  end

  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      flash[:success] = "映画を紹介しました"
      redirect_to root_url
    else
      render 'movies/new'
    end
  end

  def destroy
    @movie.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to request.referrer || root_url
  end

  def comment_create
    movie = Movie.find(params[:movie_id])
    @feed_items = movie.feed.paginate(page: params[:page], per_page: 5)
    @movie_comment = current_user.movie_comments.build(comment_create_params.merge(movie_id: params[:movie_id]))
    if @movie_comment.save
      respond_to do |format|
        format.html { redirect_to movie_path(params[:movie_id]) }
        format.js
      end
    else
      flash[:danger] = "投稿に失敗しました"
      redirect_to movie_path(params[:movie_id])
    end
  end

  def comment_destroy
    @movie_comment.destroy
    redirect_to request.referrer
  end

  private

    def movie_params
      params.require(:movie).permit(:name,
                                    :content,
                                    :screening_date,
                                    :spoiler,
                                    :category_id,
                                    :movie_maxim)
    end

    def comment_create_params
      params.require(:movie_comment).permit(:comment)
    end

    def correct_user
      @movie = current_user.movies.find_by(id: params[:id])
      redirect_to root_url if @movie.nil?
    end

    def movie_comment_correct_user
      @movie_comment = current_user.movie_comments.find_by(id: params[:movie_id])
      redirect_to root_url if @movie_comment.nil?
    end
end
