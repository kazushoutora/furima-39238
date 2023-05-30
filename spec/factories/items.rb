FactoryBot.define do
  factory :item do
    association :user
    item_name          { Faker::Lorem.sentence }
    item_description   { Faker::Lorem.sentence } 
    category_id        { 2 }
    condition_id       { 2 }
    delivery_charge_id { 2 }
    delivery_from_id   { 2 }
    delivery_time_id   { 2 }
    price              { 700 }
  end
end
