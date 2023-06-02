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

    after(:build) do |item|
      item.image.attach(io: File.open('public/20230530.png'), filename: '20230530.png', content_type: 'image/png')
    end
  end
end
