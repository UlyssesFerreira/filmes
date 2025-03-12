class WatchedMoviesController < ApplicationController
  before_action :authenticate_user!

  def create
    movie = Movie.find_by(id: params[:movie_id])
    if movie
      movie.mark_as_watched(user: current_user)
      flash[:notice] = "Adicionado a lista de assistidos!"
      redirect_to movie_path(movie)
    else
      flash[:error] = "Erro ao marcar como assistido!"
      redirect_to home_path
    end
  end
end
