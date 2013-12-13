require 'spec_helper'

describe EmailTemplate do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:body)} 
  end
  
  describe "#parse_according_to" do
    let!(:email_template) {FactoryGirl.create(:email_template)}
    let!(:user) {FactoryGirl.create(:user, email: "another_email@gmail.com")}

    it "return parsed email_template " do
      expect(email_template.parse_according_to(user)).to eq("Hello John Doe, Email: another_email@gmail.com.")
    end
  end
end