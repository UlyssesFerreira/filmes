class SearchController < ApplicationController
  PER_PAGE = 8

  def index
    @result = Movie.search(params[:query])
    @total_movies = @result.count
    @current_page = (params[:page] || 1).to_i.abs
    @total_pages = (@total_movies.to_f / PER_PAGE).ceil
    @movies = @result.offset((@current_page - 1) * PER_PAGE).limit(PER_PAGE)
  end
end
