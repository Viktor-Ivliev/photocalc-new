require 'spec_helper'

describe PrintbookController do

  describe "GET '24x32'" do
    it "returns http success" do
      get '24x32'
      response.should be_success
    end
  end

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

  describe "GET '15x20'" do
    it "returns http success" do
      get '15x20'
      response.should be_success
    end
  end

  describe "GET '20x15'" do
    it "returns http success" do
      get '20x15'
      response.should be_success
    end
  end

  describe "GET '19x19'" do
    it "returns http success" do
      get '19x19'
      response.should be_success
    end
  end

end
