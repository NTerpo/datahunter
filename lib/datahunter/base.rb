require 'colorize'
require 'launchy'

module Datahunter
  BASE_URL = "http://shrouded-harbor-5877.herokuapp.com/api/datasets/"

  def self.datasets_url tag, geo=nil, temp=nil
    tag = tag.downcase.split.first if tag
    geo = geo.downcase if geo

    if geo.nil? and temp.nil?
      "#{BASE_URL}?tags=#{tag}"
    elsif temp.nil?
      "#{BASE_URL}?tags=#{tag}&spatial=#{geo}"
    elsif geo.nil?
      "#{BASE_URL}?tags=#{tag}&temporal=#{temp}"
    else
      "#{BASE_URL}?tags=#{tag}&spatial=#{geo}&temporal=#{temp}"
    end
  end

  def self.print_dataset_info dataset
    puts ("title: ".colorize(:green) + "#{dataset["title"]}")
    puts ("description: ".colorize(:green) + "#{dataset["description"]}")
    puts ("publisher: ".colorize(:green) + "#{dataset["publisher"]}")
    puts ("temporal: ".colorize(:green) + "#{dataset["temporal"]}")
    puts ("spatial: ".colorize(:green) + "#{dataset["spatial"]}")
    puts ("created: ".colorize(:green) + "#{dataset["created"]}")
    puts ("updated: ".colorize(:green) + "#{dataset["updated"]}")
    puts ("score: ".colorize(:green) + "#{dataset["huntscore"]}")
    puts
  end

  def self.print_feedback_request
    case ask "### give feedback? (y/n)".colorize(:yellow)
    when 'y'
      Launchy.open(feedback_url, options = {})
    else
      puts "Bye for now!"
    end
  end
end
