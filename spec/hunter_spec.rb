require 'spec_helper'
require 'launchy'
require 'downloadr'
require 'addressable/uri'

describe 'Hunter' do

  before(:each) do
    @datasets = [{"description"=>"Comparison of developments in GDP", "created-ds"=>"2015-02-21T18:04:50.831Z", "tags"=>["labour", "gdp", "market", "the"], "_id"=>"54e8c8c2a8268b5c235ac62f", "publisher"=>"Office for National Statistics", "updated"=>"2015-02-18T09:22:22.556Z", "created"=>"2011-12-11T11:39:23.142Z", "spatial"=>["england", "scotland"], "title"=>"GDP and the Labour Market", "modified-ds"=>"2015-02-21T18:04:50.831Z", "uri"=>"URI Not Available", "huntscore"=>5.0, "resources"=>[{"title"=>"GDP and the Labour Market", "url"=>"http://webarchive.nationalarchives.gov.uk228166.xml", "format"=>""}, {"title"=>"GDP and the Labour Market", "url"=>"http://www.ons.gov.uk/ons/dcp19975_228158.xml", "format"=>""}], "temporal"=>["2011", "2012"]},
{"description"=>"Regional Gross Value Added (GVA)", "created-ds"=>"2015-02-21T18:06:09.304Z", "tags"=>["gross", "regional"], "_id"=>"54e8c911a8268b5c235ac855", "publisher"=>"Office for National Statistics", "updated"=>"2014-12-18T10:19:46.273Z", "created"=>"2013-12-19T09:29:03.755Z", "spatial"=>["england", "scotland"], "title"=>"Regional Gross Value Added (Production approach)", "modified-ds"=>"2015-02-21T18:06:09.304Z", "uri"=>"URI Not Available", "huntscore"=>5.0, "resources"=>[], "temporal"=>["2013", "2014"]}]

    @url = "http://data.consumerfinance.gov/api/views.json"
    @bad_url = "https://www.data.gouv.fr/fr/datasets/population/"
    @invalid_url = "foo bar"
  end

  describe 'download a file' do
    
    it 'should raise an error with an invalid uri' do
      lambda { Datahunter.download_file @invalid_url }.should   raise_error(Launchy::ApplicationNotFoundError) 
    end    
    
    it 'should open the browser if the file extension is not acceptable' do
      lambda { Datahunter.download_file @bad_url }.should_not raise_error
      
    end
    
    it 'should ask if rename the file if the file extension is acceptable' do
      lambda { Datahunter.download_file @url }.should raise_error(NoMethodError)
    end
  end

  describe 'download some data' do

  end

  describe 'open the browser' do

  end

  describe 'get a dataset' do

  end
end
