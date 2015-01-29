require 'colorize'
require 'launchy'
require 'downloadr'
require 'addressable/uri'

require 'easy_downloader'

module Datahunter

#  DATASETS_URL = "http://localhost:3000/api/datasets/"
  DATASETS_URL = "http://shrouded-harbor-5877.herokuapp.com/api/datasets/"
  FEEDBACK_URL = "https://docs.google.com/forms/d/1yNzZjCCXvWHQCbWz4sx-nui3LafeeLcT7FF9T-vbKvw/viewform"
  REQUEST_URL = "https://docs.google.com/forms/d/1NRKWmb_mcpKJmrutXvZSZnysM_v0rfLhjD897H3Myrw/viewform?usp=send_form"

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

  def self.ds_url id
    "#{DATASETS_URL}#{id}"    
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
 
  def self.download_the_data dataset
    resources = dataset["resources"]
    number_of_downloadable_links = resources.size

    if number_of_downloadable_links == 1
      dl = 0
    else
      Datahunter.print_downloadable_links resources
      dl = ask("### which one? (0/1/...)".colorize(:yellow), Integer) {|i| i.in = 0..(number_of_downloadable_links - 1)}
    end

    dl = dl.to_i
    Datahunter.download_file(resources[dl]["url"], resources[dl]["format"], dataset["uri"])
  end

## Messages: feedback and excuses

  def self.print_feedback_request
    case ask "### give feedback? (y/n)".colorize(:yellow)
    when 'y'
      Launchy.open(FEEDBACK_URL, options = {})
    else
      puts "Bye for now!"
    end
  end

  def self.print_request_dataset_message
    case ask "### request a dataset? (y/n)".colorize(:yellow)
    when 'y'
      Launchy.open(REQUEST_URL, options = {})
    end
  end
  
  def self.print_excuse_message
    puts "Remember, this is a first prototype, there will surely be a lot more "\
         "datasets indexed soon. If you want us to find a dataset for you, or "\
         "if you just want to give us a feedback, don't hesitate!".colorize(:red)
  end

  def self.dl_file url, path=""
    Downloadr::HTTP.download(url)
  end

  private
  
  def self.print_downloadable_links resources
    resources.each_with_index do |dl, i|
      puts ("#{i}. ".colorize(:yellow) +
            "#{dl["title"]} - ".colorize(:blue) + 
            "#{dl["format"]}".colorize(:green))
    end
  end
  
  def self.download_file url, format="", alt_url=""
    if format == "HTML"
      Launchy.open(url, options = {})
    else
      puts "Start downloading..."
      
      # Downloadr::HTTP.download(url)
      puts "Your file has been downloaded, try to $ ls ;D".colorize(:green)
      Datahunter.print_excuse_and_alternative_url_message alt_url
    end
  end

  def self.print_excuse_and_alternative_url_message alt_url=""
    puts "If this is not the file you expected, it's maybe because publisher don't always keep the metadata up-to-date. We try to clean most of uri's and check the url. Anyway you may be able to download your file by hand here:"
    puts "#{alt_url}".colorize(:blue)
  end
end
