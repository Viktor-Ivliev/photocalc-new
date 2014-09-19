require 'spec_helper'

describe SlimbookController do

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

  describe "GET '18x24'" do
    it "returns http success" do
      get '18x24'
      response.should be_success
    end
  end

  describe "GET '23x23'" do
    it "returns http success" do
      get '23x23'
      response.should be_success
    end
  end

  describe "GET '29x19'" do
    it "returns http success" do
      get '29x19'
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
