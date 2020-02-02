FactoryBot.define do
  factory :ticket do
    number { rand(123456789) }
    event { 1 }
    sold_originally { false }
    sold_on_marketplace { false }
    on_resell { false }
    price { 100 }
    purchaser_id { 1 }
  end
end
