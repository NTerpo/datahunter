require 'spec_helper'
require 'rest_client'
require 'json'

describe "Datahunter API calls" do 

  DATASETS_URL = "http://shrouded-harbor-5877.herokuapp.com/api/datasets/"

  describe 'Should create a correct datasets_url to call the API' do
    it 'should return a correct url' do
      url = Datahunter.datasets_url("population", "france", "2010")
      expect(url).to eq("#{DATASETS_URL}?tags=population&spatial=france&temporal=2010")
    end
  end

  describe 'Should receive a dataset corresponding to the query' do
    response = RestClient.get("#{DATASETS_URL}?tags=population",
                              :content_type => :json)
    res = JSON.parse(response.body).reverse.first

    it 'should have the tag corresponding to the query keyword' do
      res["tags"].should include("population")
    end
  end
end
