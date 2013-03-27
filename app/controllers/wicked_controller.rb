class WickedController < ApplicationController
  def index
    athletes             = Athlete.where(:affiliate => 'wicked').order('qualified asc')
    male_athletes        = athletes.where(:gender => 'Male')
    female_athletes      = athletes.where(:gender => 'Female')
    @individual_men      = male_athletes.where('age < 40')
    @masters_40_44_men   = male_athletes.where('age > 39 and age < 45')
    @masters_45_49_men   = male_athletes.where('age > 44 and age < 50')
    @masters_50_54_men   = male_athletes.where('age > 49 and age < 55')
    @individual_women    = female_athletes.where('age < 40')
    @masters_40_44_women = female_athletes.where('age > 39 and age < 45')
    @masters_45_49_women = female_athletes.where('age > 44 and age < 50')
    @masters_55_59_women = female_athletes.where('age > 54 and age < 60')
  end
end

