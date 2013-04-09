class SouthieController < ApplicationController
  def index
    athletes           = Athlete.where(:affiliate => 'southie').order('qualified desc, total asc')
    male_athletes      = athletes.where(:gender => 'Male')
    female_athletes    = athletes.where(:gender => 'Female')
    @individual_men    = male_athletes.where('age < 40')
    @masters_40_44_men = male_athletes.where('age > 39 and age < 45')
    @masters_50_54_men = male_athletes.where('age > 49 and age < 55')
    @masters_55_59_men = male_athletes.where('age > 54 and age < 60')
    @masters_60_men    = male_athletes.where('age > 60')
    @individual_women  = female_athletes.where('age < 40')
  end
end

