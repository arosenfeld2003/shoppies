class ImdbService
  def get_movies_by_title_fragment(str)
    # set on heroku CLI: heroku config:set OMDB_API_KEY='insert_key_here'
    OMDB_API_KEY = ENV['OMDB_API_KEY']
    #LOCAL: request = "http://www.omdbapi.com/?apikey=#{ENV["OMDB_API_KEY"]}&s=#{str}"
    request = "http://www.omdbapi.com/?apikey=#{OMDB_API_KEY}&s=#{str}"
    response = HTTParty.get("#{request}").parsed_response
    return response
  end


  def get_movie_by_title(title)
    # set on heroku CLI: heroku config:set OMDB_API_KEY='insert_key_here'
    OMDB_API_KEY = ENV['OMDB_API_KEY']
    request = "http://www.omdbapi.com/?apikey=#{OMDB_API_KEY}&t=#{title}"
    response = HTTParty.get("#{request}").parsed_response
    return response
  end
end