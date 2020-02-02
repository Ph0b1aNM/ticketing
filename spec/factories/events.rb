FactoryBot.define do
  factory :event do
    name { "Test Event" }
    number_of_tickets { 1 }
    date { "2020-10-08" }
    description { "Test text for Test Event" }
    creator { "Test User" }
    catagory_id { 1 }
  end
end
