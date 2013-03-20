class SouthieController < ApplicationController
  def index
    @athletes = Athlete.where(:affiliate => 'southie').order("total asc")
  end
end

