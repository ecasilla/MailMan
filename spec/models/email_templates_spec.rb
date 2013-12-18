require 'spec_helper'

describe EmailTemplate do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:body)} 
  end
  
  describe "#parse_according_to" do
    let!(:email_template) {FactoryGirl.create(:email_template)}
    let!(:recipient) {FactoryGirl.create(:recipient)}

    it "returns a parsed email template with correct user info" do     
      expect(email_template.parse_according_to(recipient)).to eq("Hello John Doe, Email: another_email_@gmail.com, Phone: 555-555-5555.")
    end
  end
end