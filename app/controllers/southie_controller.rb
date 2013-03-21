class SouthieController < ApplicationController
  def index
    @athletes = Athlete.where(:affiliate => 'southie').order("total asc")
    @individual_men = Athlete.where(:affiliate => 'southie').where('age < 40').where('gender == "Male"').order('total asc')
    @masters_40_44_men = Athlete.where(:affiliate => 'southie').where('age > 39 and age < 45').where('gender == "Male"').order('total asc')
    @masters_50_54_men = Athlete.where(:affiliate => 'southie').where('age > 49 and age < 55').where('gender == "Male"').order('total asc')
    @masters_55_59_men = Athlete.where(:affiliate => 'southie').where('age > 54 and age < 60').where('gender == "Male"').order('total asc')
    @masters_60_men = Athlete.where(:affiliate => 'southie').where('age > 60').where('gender == "Male"').order('total asc')
    @individual_women = Athlete.where(:affiliate => 'southie').where('age < 40').where('gender == "Female"').order('total asc')
  end
end

