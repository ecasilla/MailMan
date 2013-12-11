FactoryGirl.define do
  factory :campaigns do
    name "Test Campaign"
    date "12/1/13"
    user
  end
end