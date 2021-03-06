class SearchController < ApplicationController
  def index
    if params[:search]
      query_service = ImdbService.new
      @result = query_service.get_movies_by_title_fragment(params[:search])
      @movie_list = @result["Search"]
      @nominated = []
      # If successful, @result will be a hash
      if @result.is_a? String
        @error_message = error_response(@result.to_i)
      elsif @movie_list != nil
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

  def error_response(error_code)
    case error_code
      when 100..199
        return "Error #{error_code}: Request initiated by the browser is continuing."
      when 300..399
        return "Request returned #{error_code}: Redirection."
      when 400..499
        return "Client Error #{error_code}: Check the OMDB API request parameters."
      when 500...600
        return "Servor Error #{error_code}: Sorry, looks like OMDB is having a bad day."
    end
  end
end