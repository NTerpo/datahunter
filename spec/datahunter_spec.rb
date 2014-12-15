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

  describe 'Should get the right HTTP codes when calling the API' do
    response_ok = RestClient.get("#{DATASETS_URL}?tags=population",
                                 :content_type => :json)
    response_ni = RestClient.get(DATASETS_URL,
                                 :content_type => :json){|response, request, result| response}
    response_nf = RestClient.get("#{DATASETS_URL}?tags=foo",
                                 :content_type => :json){|response, request, result| response}
    response_nff = RestClient.get("http://shrouded-harbor-5877.herokuapp.com/api/foo",
                                 :content_type => :json){|response, request, result| response}
    
     it 'should return an HTTP 200 with a correct url' do
      response_ok.code.should eq(200)
    end

    it 'should return an HTTP 501 when calling api/datasets/' do
      response_ni.code.should eq(501)
    end

    it 'should return an HTTP 500 when a query has no result' do
      response_nf.code.should eq(500)
    end

    it 'should return an HTTP 404 when calling a non defined URL' do
      response_nff.code.should eq(404)
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
