class SearchController < ApplicationController
  def index
    if params[:search]
      query_service = ImdbService.new
      @movie_list = query_service.get_movies_by_title_fragment(params[:search])["Search"]
      @nominated = []
      if @movie_list != nil
        @movie_list.each do |movie|
          prior_nommination = Nomination.where("nominations.movie->>'imdbID' = ?", "#{movie["imdbID"]}")
          if prior_nommination.length > 0
            @nominated.push(movie["Title"])
          end
        end
      end
      render "results/index"
    else
      @movie_list = nil
      @selected = nil
    end
  end
end