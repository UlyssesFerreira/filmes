class WatchedMoviesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_movies = current_user.watched_movies.order(watched_at: :desc)
  end

  def new
    @movie = Movie.find(params[:movie_id])
  end

  def create
    @movie = Movie.find_by(id: params[:movie_id])
    @review = @movie.mark_as_watched(user: current_user, watched_at: params[:watched_at], rating: params[:rating], comment: params[:comment])
    if @movie && @review.save
      flash[:notice] = "Adicionado a lista de assistidos!"
      redirect_to my_movies_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
