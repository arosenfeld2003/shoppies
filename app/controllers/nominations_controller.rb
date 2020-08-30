class NominationsController < ApplicationController
  before_action :set_nomination, only: [:nominate]

  # GET /nominations
  # GET /nominations.json
  def index
    @nominations = Nomination.all
  end

  # POST /nominations
  # POST /nominations.json
  def create
    @nomination = Nomination.new(nomination_params)

    respond_to do |format|
      if @nomination.save
        format.html { redirect_to @nomination, notice: 'Nomination was successfully created.' }
        format.json { render :show, status: :created, location: @nomination }
      else
        format.html { render :new }
        format.json { render json: @nomination.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    nominate(params)
  end

  # DELETE /nominations/1
  # DELETE /nominations/1.json
  def destroy
    if !params["format"]
      clear()
    else
      Nomination.where("nominations.movie->>'Title' = ?", "#{params["format"]}").delete_all
      @nominations = Nomination.all
      render "nominations/index"
    end
  end

  def clear
    Nomination.all.delete_all
    # respond_to do |format|
    #   format.html { redirect_to nominations_url, notice: 'Nomination was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
    render "nominations/index"
  end

  def nominate(params)
    query_service = ImdbService.new
    movie = query_service.get_movie_by_title(params["format"])
    if movie["Response"] == "False"
    else
      Nomination.create(movie: movie)
    end

    @nominations = Nomination.all
    render "nominations/index"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nomination
      #nomination = Nomination.where("nominations.movie->>'{movie,Title}' = ?", "#{params["format"]}")
      nomination = Nomination.where("nominations.movie->>'Title' = ?", "#{params["format"]}")
      if nomination == []
        nominate(params)
      end
    end

    # Only allow a list of trusted parameters through.
    def nomination_params
      params.fetch(:nomination, {})
    end
end
