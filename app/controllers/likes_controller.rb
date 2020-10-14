class LikesController < ApplicationController
  before_action :logged_in_user


  def create
    @movie = Movie.find(params[:movie_id])
    unless @movie.iine?(current_user)
      @movie.iine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def index
    @movies = Movie.where(id: current_user.likes.all.pluck(:movie_id)).paginate(page: params[:page], per_page: 5)
  end

  def destroy
    @movie = Like.find(params[:id]).movie
    if @movie.iine?(current_user)
      @movie.uniine(current_user)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end
end
