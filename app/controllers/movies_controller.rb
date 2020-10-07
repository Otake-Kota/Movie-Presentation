class MoviesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :destroy]
  before_action :correct_user,   only: [:destroy]

  def show
    @movie = Movie.find(params[:id])
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

  private

    def movie_params
      params.require(:movie).permit(:name,
                                    :content,
                                    :screening_date,
                                    :spoiler,
                                    :category_id,
                                    :movie_maxim)
    end

    def correct_user
      @movie = current_user.movies.find_by(id: params[:id])
      redirect_to root_url if @movie.nil?
    end
end
