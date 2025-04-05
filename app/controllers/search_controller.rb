class SearchController < ApplicationController
  def index
    @q = Movie.ransack(title_or_original_title_cont: params[:query], downloaded: true, order_by_rating: true)
    @movies = @q.result.limit(8)
  end
end
