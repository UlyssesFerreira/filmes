class FavoritesController < ApplicationController
  def index
    @fav_movies = current_user.favorites
  end

  def create
    movie = Movie.find(params[:movie_id])
    if movie && movie.favorite(current_user)
      flash[:notice] = "#{movie.title} adicionado aos favoritos"
      redirect_to my_favorites_path
    else
      flash[:notice] = "Erro ao favoritar"
      redirect_to root_path
    end
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    if movie && movie.remove_favorite(current_user)
      flash[:notice] = "#{movie.title} removido dos favoritos"
      redirect_to my_favorites_path
    else
      flash[:notice] = "Erro ao remover dos favoritos"
      redirect_to root_path
    end
  end
end
