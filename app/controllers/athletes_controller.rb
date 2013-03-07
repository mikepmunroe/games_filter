class AthletesController < ApplicationController
  # GET /athletes
  # GET /athletes.json
  def index
    @athletes = Athlete.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @athletes }
    end
  end

  # GET /athletes/1
  # GET /athletes/1.json
  def show
    @athlete = Athlete.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @athlete }
    end
  end
end
