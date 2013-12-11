FactoryGirl.define do
  factory :email_templates do
    campaign
    name "Sales"
    body "These Are the Quarterly Sales"
    date "12/1/13"
  end
end