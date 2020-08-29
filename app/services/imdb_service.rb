class ImdbService

  def get_movies_by_title_fragment(str)
    request = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&s=#{str}"
    response = HTTParty.get("#{request}").parsed_response
    return response
  end


  def get_movie_by_title(title)
    request = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&t=#{title}"
    response = HTTParty.get("#{request}").parsed_response
    return response
  end

end