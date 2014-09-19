require 'spec_helper'

describe PhotobookController do

  describe "GET '30x30'" do
    it "returns http success" do
      get '30x30'
      response.should be_success
    end
  end

  describe "GET '20x30'" do
    it "returns http success" do
      get '20x30'
      response.should be_success
    end
  end

  describe "GET '30x20'" do
    it "returns http success" do
      get '30x20'
      response.should be_success
    end
  end

  describe "GET '20x20'" do
    it "returns http success" do
      get '20x20'
      response.should be_success
    end
  end

end
