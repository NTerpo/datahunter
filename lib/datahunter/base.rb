require 'colorize'
require 'launchy'
require 'downloadr'
require 'addressable/uri'

module Datahunter

  # DATASETS_URL = "http://localhost:3000/api/datasets/"
  DATASETS_URL = "http://shrouded-harbor-5877.herokuapp.com/api/datasets/"
  FEEDBACK_URL = "https://docs.google.com/forms/d/1yNzZjCCXvWHQCbWz4sx-nui3LafeeLcT7FF9T-vbKvw/viewform"
  REQUEST_URL =
    "https://docs.google.com/forms/d/1NRKWmb_mcpKJmrutXvZSZnysM_v0rfLhjD897H3Myrw/viewform?usp=send_form"

  @extensions = ["json", "csv", "xml", "zip", "gz", "xls", "xlsx", "shp", "docx", "doc", "pdf", "txt", "tsv"]

  def self.query_string_builder string
    s = string
        .strip
        .gsub(/ {3,}/, ' ')
        .gsub(/ {2,}/, ' ')
        .gsub(/ /, '+')
    "?q=#{s}"
  end

  def self.datasets_url query
    "#{DATASETS_URL}#{Datahunter.query_string_builder query}"
  end

  def self.ds_url id
    "#{DATASETS_URL}#{id}"    
  end

  def self.print_dataset_info dataset
    puts ("#{dataset["title"]}".colorize(:green))
    puts ("#{dataset["description"]}".colorize(:blue))
    puts
    puts ("publisher: ".colorize(:blue) + "#{dataset["publisher"]}")
    puts ("temporal: ".colorize(:blue) + "#{dataset["temporal"]}")
    puts ("spatial: ".colorize(:blue) + "#{dataset["spatial"]}")
    puts ("created: ".colorize(:blue) + "#{dataset["created"]}")
    puts ("updated: ".colorize(:blue) + "#{dataset["updated"]}")
    puts ("score: ".colorize(:blue) + "#{dataset["huntscore"]}")
  end

  def self.print_coll_of_datasets_info_light coll_of_datasets
    coll_of_datasets.each_with_index do |ds, index|
      puts ("#{index+1}. ".colorize(:yellow) +
            "#{ds["title"]}".colorize(:green) +
            " id: ".colorize(:blue) +
            "#{ds["_id"]}")
      puts ("#{ds["spatial"].take(5)}")
      puts ("#{ds["description"][0..100].gsub(/\w+\s*$/,'...')}".colorize(:blue))
    end
    puts
  end

  def self.print_downloadable_links resources
    resources.each_with_index do |dl, i|
      puts ("#{i}. ".colorize(:yellow) +
            "#{dl["title"]} - ".colorize(:blue) + 
            "#{dl["format"]}".colorize(:green))
    end
  end

  def self.parse_extension_from_uri uri
    uri.basename.split(".").last
  end
  
  def self.download_file url, format="", alt_url=""
    uri = Addressable::URI.parse(url)
    extension = Datahunter.parse_extension_from_uri uri

    if !@extensions.include? extension
      Launchy.open(url, options = {})
    else
      location = Dir.pwd
      uri = Addressable::URI.parse(url)
      file_name = uri.basename
      loc = location + "/" + file_name

      case ask ("### Create/overwrite #{loc}?(y/rename/n)".colorize(:yellow))
      when 'rename'
        loc = ask "Path/to/filename: ".colorize(:yellow)
      when 'n'
        abort("Ok then")
      end
      puts "### Start downloading..."
      Downloadr::HTTP.download(url, loc)
      puts "### Your file has been downloaded ;)".colorize(:green)
      Datahunter.print_excuse_and_alternative_url_message alt_url
    end
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
  
  def self.open_in_browser url
    if url =~ /\A#{URI::regexp}\z/
      puts "You can't download this dataset directly, but you should from there"
      Launchy.open(url, options = {})
    else
      Datahunter.print_bad_uri_message
    end
  end

  def self.get_dataset dataset
    if dataset.has_key?("resources") and dataset["resources"].any?
      Datahunter.download_the_data dataset
    else
      Datahunter.open_in_browser dataset["uri"]
    end
  end

  ## Messages
  def self.print_no_dataset_message
    puts "We've found nothing for your query. "\
         "Remember, this is a first prototype, there will be a lot more "\
         "datasets indexed soon. If you want us to find a dataset for you, or "\
         "if you just want to give us a feedback, don't hesitate!".colorize(:red)
  end

  def self.print_excuse_and_alternative_url_message alt_url=""
    puts "If this is not the file you expected, it's maybe because publisher"\
         " don't always keep the metadata up-to-date. We try to clean most of"\
         " uri's and check the url. Anyway you may be able to download your"\
         " file by hand here:"
    puts "#{alt_url}".colorize(:blue)
  end

  def self.print_bad_uri_message
    puts "The URL given by the publisher is not valid. We'll try to find out why "\
         "as soon as we can!".colorize(:red)
  end

  
  ## Feedback requests  
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
end
