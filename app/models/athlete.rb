require 'open-uri'

class Athlete < ActiveRecord::Base
  attr_accessible :name, :url, :w1, :w2, :w3, :w4, :w5


  def self.populate_initial_data
    urls = {wicked: "http://games.crossfit.com/affiliate/2793", southie: "http://games.crossfit.com/affiliate/1365"}

    urls.each do |affiliate, url|
      athlete_list = Nokogiri::HTML(open(url))
      athlete_list.css("#block-search-athlete-affiliate-team-blocks-affiliate-athletes a").each do |athlete|
        record = Athlete.find_or_initialize_by_url(athlete['href'])
        record.affiliate = affiliate.to_s
        record.save
      end
    end
  end

  def self.populate_details
    Athlete.all.each do |athlete|
      details = Nokogiri::HTML(open("http://games.crossfit.com" + athlete.url))
      name = details.at_css(".page-title").text
      puts name
      athlete.name = name.gsub(/^[^:]+:\s*/, "")
      puts athlete.name
      attributes = details.xpath('//dd//text()').collect(&:text)
      athlete.region = attributes[0]
      athlete.team   = attributes[1]
      athlete.gender = attributes[3]
      athlete.age    = attributes[4]
      athlete.height = attributes[5]
      athlete.weight = attributes[6]
      athlete.save
    end
  end

  def self.populate_scores
    Athlete.all.each do |athlete|
      details = Nokogiri::HTML(open("http://games.crossfit.com" + athlete.url))
      leaderboard_src = details.xpath('//iframe[@id="cf_leaderboard"]/@src').text()
      leaderboard = Nokogiri::HTML(open(leaderboard_src))
      scores = leaderboard.xpath('//table/tbody/tr[@class="highlight"]/td/span[@class="display"]/text()').collect(&:text)
      athlete.w1 = scores[0]
      athlete.w2 = scores[2]
      athlete.w3 = scores[4]
      athlete.w4 = scores[6]
      athlete.w5 = scores[8]
      positions = []
      scores.each do |value|
        if (match = value.scan(/\A\d*/))
          if (match[1])
            positions << match[0].to_i
          end
        end
      end
      athlete.total = positions.inject(0) {|sum, i| sum + i}
      athlete.save
    end
  end

  def self.qualify
    Athlete.all.each do |athlete|
      scores = []
      scores << athlete.w1
      scores << athlete.w2
      scores << athlete.w3
      scores << athlete.w4
      scores << athlete.w5

      scores.each do |value|
        puts value
        if (match = value.match(/\A\d/))
          if (match)
            athlete.qualified = true
          else
            athlete.qualified = false
          end
        end
      end
      athlete.save
    end
  end
end

