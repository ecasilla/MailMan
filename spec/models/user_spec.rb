require 'spec_helper'

describe User do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)} 
  end
  describe "Create New Campaign" do
    before do
      FactoryGirl.create(:user)
      FactoryGirl.create(:campaign)
      user.campaigns.create
    end
    it "should add a new Campaign" do
      expect(user.campaign).to_not eq(nil) 
    end
  end
end