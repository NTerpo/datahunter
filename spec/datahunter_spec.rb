require 'spec_helper'

describe "Datahunter Base" do 

  before(:each) do
    DATASETS_URL = "http://shrouded-harbor-5877.herokuapp.com/api/datasets/"
  end
  
  describe 'create correct datasets_url' do
    it 'should return a correct url' do
      url = Datahunter.datasets_url("population", "france", "2010")
      expect(url).to eq("#{DATASETS_URL}?tags=population&spatial=france&temporal=2010")
    end
  end
end
