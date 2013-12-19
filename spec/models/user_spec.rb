require 'spec_helper'

describe User do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)} 
  end

  describe "#create_api_key" do
    let!(:user) {FactoryGirl.create(:user)}
    it "should generate a random random token" do
      expect(user.api_key.access_token).to_not be(nil)
    end
  end
end