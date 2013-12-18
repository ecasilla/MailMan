FactoryGirl.define do
  factory :recipient do
    first_name "John"
    last_name "Doe"
    email "another_joe@gmail.com"
    phone "555'-'555'-'5555"
    user
  end
end