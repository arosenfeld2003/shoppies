class SearchController < ApplicationController
  def index
    if params[:search]
      query_service = ImdbService.new
      @movie_list = query_service.get_movies_by_title_fragment(params[:search])["Search"]
      render "results/index"
    else
      @movie_list = nil
      @selected = nil
    end
  end
end