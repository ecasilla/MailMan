require 'spec_helper'

describe Recipients do
   describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:name)} 
  end
end