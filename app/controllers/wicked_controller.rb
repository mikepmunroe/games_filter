class WickedController < ApplicationController
  def index
    @athletes = Athlete.where(:affiliate => 'wicked').order("total asc")
  end
end

