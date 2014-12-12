require 'colorize'
require 'launchy'
# require 'MDownloader'
require 'mechanize-downloader'

module Datahunter

  DATASETS_URL = "http://localhost:3000/api/datasets/"
#  DATASETS_URL = "http://shrouded-harbor-5877.herokuapp.com/api/datasets/"
  FEEDBACK_URL = "https://docs.google.com/forms/d/1yNzZjCCXvWHQCbWz4sx-nui3LafeeLcT7FF9T-vbKvw/viewform"

  def self.datasets_url tag, geo=nil, temp=nil
    tag = tag.downcase.split.first if tag
    geo = geo.downcase if geo

    if geo.nil? and temp.nil?
      "#{DATASETS_URL}?tags=#{tag}"
    elsif temp.nil?
      "#{DATASETS_URL}?tags=#{tag}&spatial=#{geo}"
    elsif geo.nil?
      "#{DATASETS_URL}?tags=#{tag}&temporal=#{temp}"
    else
      "#{DATASETS_URL}?tags=#{tag}&spatial=#{geo}&temporal=#{temp}"
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
  
  def self.print_downloadable_links dataset
    dataset["resources"].each_with_index do |dl, i|
      puts ("#{i}. ".colorize(:yellow) +
            "#{dl["title"]} - ".colorize(:blue) + 
            "#{dl["format"]}".colorize(:green))
    end
  end

  # def self.download_file url
  #   path = '~/testfile.zip'

  #   options = Hash.new
  #   options[:retry]  = :any #retry times, :any(any times retry), 0(no retry), or custom numbers(int)
  #   options[:resume] = true #true or false, resume continue download, break point resume download

  #   result, error = MDownloader.download(url, path, options) do |report|
  #     puts "Progress:#{report[:percent]}% Lave:#{report[:min]}m#{report[:sec]}"
  #   end

  #   if result
  #     puts 'Download finished!'
  #   else
  #     puts 'Download failed...'
  #     puts error
  #   end
  # end

  def self.download_file url
    path = '~/Downloads/'
    Mechanize.new {|agent|
      agent.download(url)
    }
  end

  def self.print_feedback_request
    case ask "### give feedback? (y/n)".colorize(:yellow)
    when 'y'
      Launchy.open(FEEDBACK_URL, options = {})
    else
      puts "Bye for now!"
    end
  end

  def self.print_excuse_message
    puts "Remember, this is a first prototype, there will surely be a lot more "\
         "datasets indexed soon. If you want us to find a dataset for you, or "\
         "if you just want to give us a feedback, don't hesitate!".colorize(:red)
  end
end
