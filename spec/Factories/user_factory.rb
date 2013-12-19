FactoryGirl.define do
  factory :user do
    last_name "Doe"
    first_name "John"
    sequence(:email) { |n| "test#{n}@new.com" }
    password "test123"
    password_confirmation "test123"
  end
end