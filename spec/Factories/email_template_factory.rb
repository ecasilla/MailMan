FactoryGirl.define do
  factory :email_template do
    campaign
    name "Sales"
    body "Hello <%= first_name %> <%= last_name %>, Email: <%= email %>."
    #date "12/1/13"
  end
end