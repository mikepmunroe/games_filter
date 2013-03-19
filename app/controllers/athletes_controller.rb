class AthletesController < ApplicationController
  def index
    @athletes = Athlete.order("total asc")
  end

  def show
    @athlete = Athlete.find(params[:id])
  end
end

