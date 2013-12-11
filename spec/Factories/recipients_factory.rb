FactoryGirl.define do
  factory :recipients do
    name "Joe"
    email "Joe@new.com"
    user
  end
end