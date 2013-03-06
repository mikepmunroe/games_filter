require 'open-uri'

class Athlete < ActiveRecord::Base
  attr_accessible :name, :url, :w1, :w2, :w3, :w4, :w5


  def self.populate_data
    urls = {wicked: "http://games.crossfit.com/affiliate/2793", southie: "http://games.crossfit.com/affiliate/1365"}

    urls.each do |affiliate, url|
      athlete_list = Nokogiri::HTML(open(url))
      # puts athlete_list.at_css("title").text
      athlete_list.css("#block-search-athlete-affiliate-team-blocks-affiliate-athletes a").each do |athlete|
        record = Athlete.find_or_initialize_by_url(athlete['href'])
        record.affiliate = affiliate.to_s
        record.save
      end
    end
  end
end
