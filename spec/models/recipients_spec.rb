require 'spec_helper'

describe Recipient do
   describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:first_name)} 
    it {should validate_presence_of(:last_name)} 
  end
end