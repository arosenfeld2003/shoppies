class ImdbService
  # set ENV on heroku CLI: `heroku config:set OMDB_API_KEY='insert_key_here'`
  # LOCAL: request = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&s=#{str}"

  def get_movies_by_title_fragment(str)
    omd_api_key = ENV['OMDB_API_KEY']
    request = "http://www.omdbapi.com/?apikey=#{omd_api_key}&s=#{str}"
    result = handle_errors(HTTParty.get("#{request}"))
    return result
  end

  def get_movie_by_title(title)
    omd_api_key = ENV['OMDB_API_KEY']
    request = "http://www.omdbapi.com/?apikey=#{omd_api_key}&t=#{title}"
    result = handle_errors(HTTParty.get("#{request}"))
    return result
  end

  def handle_errors(response)
    if response.code == 200..299
      # successful request
      return response.parsed_response
    else
      return response.code.to_s
    end
  end
end

  # handle errors
  # if params[:search]
  #   query_service = ImdbService.new
  #   @movie_list = query_service.get_movies_by_title_fragment(params[:search])["Search"]
  #   @nominated = []
  #   if @movie_list != nil
  #     @movie_list.each do |movie|
  #       prior_nommination = Nomination.where("nominations.movie->>'imdbID' = ?", "#{movie["imdbID"]}")
  #       if prior_nommination.length > 0
  #         @nominated.push(movie["Title"])
  #       end
  #     end
  #   end