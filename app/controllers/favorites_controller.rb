class FavoritesController < ApplicationController
  def index
    @fav_movies = current_user.favorites.order(created_at: :desc)
  end

  def create
    movie = Movie.find(params[:movie_id])
    fav = movie.favorite(current_user)
    if movie && fav.save
      flash[:success] = "#{movie.title} adicionado aos favoritos"
    else
      flash[:error] = "Erro ao favoritar"
    end
    redirect_to my_favorites_path
  end

  def destroy
    movie = Movie.find(params[:movie_id])
    if movie && movie.remove_favorite(current_user)
      flash[:success] = "#{movie.title} removido dos favoritos"
    else
      flash[:error] = "Erro ao remover dos favoritos"
    end
    redirect_to my_favorites_path
  end
end
