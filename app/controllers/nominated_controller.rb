class NominatedController < ApplicationController
  before_action :set_nominated

  def set_nominated
    if !@nominated
      @nominated = []
    end
  end

  def nominate
    query_service = ImdbService.new
    result = query_service.get_movie_by_title(params["format"])
    if result["Response"] == "False"
    else
      @nominated.push(query_service.get_movie_by_title(params["format"]))
    end
    render "nominated/index"
  end
end
