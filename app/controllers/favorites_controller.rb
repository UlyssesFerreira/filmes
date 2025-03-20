class FavoritesController < ApplicationController
  def create
    movie = Movie.find(params[:movie_id])
    if movie && movie.favorite(current_user)
      flash[:notice] = "#{movie.title} adicionado aos favoritos"
      redirect_to root_path
    else
      flash[:notice] = "Erro ao favoritar"
      redirect_to root_path
    end
  end
end
