FactoryGirl.define do
  factory :recipient do
    first_name "John"
    last_name "Doe"
    email "another_joe@gmail.com"
    phone 5555555555
    user
  end
end