class StaticPagesController < ApplicationController
  def home
    @movies = Movie.all.paginate(page: params[:page], per_page: 15)
  end

  def help
  end
end
