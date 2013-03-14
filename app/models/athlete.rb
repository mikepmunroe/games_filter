require 'open-uri'

class Athlete < ActiveRecord::Base
  attr_accessible :name, :url, :w1, :w2, :w3, :w4, :w5


  def self.populate_initial_data
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

  def self.populate_details
    athletes = Athlete.all
    athletes.each do |athlete|
      details = Nokogiri::HTML(open("http://games.crossfit.com" + athlete.url))
      name = details.at_css(".page-title").text
      puts name
      athlete.name = name.gsub(/^[^:]+:\s*/, "")
      puts athlete.name
      attributes = Array.new
      details.xpath('//dd//text()').each do |attribute|
        attributes << attribute.text
      end
      athlete.region = attributes[0]
      athlete.team = attributes[1]
      athlete.gender = attributes[3]
      athlete.age = attributes[4]
      athlete.height = attributes[5]
      athlete.weight = attributes[6]
      athlete.save
    end
  end
end
