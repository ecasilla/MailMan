FactoryGirl.define do
  factory :user do
    last_name "Doe"
    first_name "John"
    email "test1@new.com"
    password "test123"
    password_confirmation "test123"
  end
end