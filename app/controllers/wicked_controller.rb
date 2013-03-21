class WickedController < ApplicationController
  def index
    @athletes = Athlete.where(:affiliate => 'wicked').order("total asc")
    @individual_men = Athlete.where(:affiliate => 'wicked').where('age < 40').where('gender == "Male"').order('total asc')
    @masters_40_44_men = Athlete.where(:affiliate => 'wicked').where('age > 39 and age < 45').where('gender == "Male"').order('total asc')
    @masters_45_49_men = Athlete.where(:affiliate => 'wicked').where('age > 44 and age < 50').where('gender == "Male"').order('total asc')
    @masters_50_54_men = Athlete.where(:affiliate => 'wicked').where('age > 49 and age < 55').where('gender == "Male"').order('total asc')
    @individual_women = Athlete.where(:affiliate => 'wicked').where('age < 40').where('gender == "Female"').order('total asc')
    @masters_40_44_women = Athlete.where(:affiliate => 'wicked').where('age > 39 and age < 45').where('gender == "Female"').order('total asc')
    @masters_45_49_women = Athlete.where(:affiliate => 'wicked').where('age > 44 and age < 50').where('gender == "Female"').order('total asc')
    @masters_55_59_women = Athlete.where(:affiliate => 'wicked').where('age > 54 and age < 60').where('gender == "Female"').order('total asc')
  end
end

