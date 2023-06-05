FactoryBot.define do
  factory :buy_address do   
    postal_code      { '123-4567' }
    delivery_from_id { 2 }
    municipality     { '横浜市港北区' }
    house_number     { '七丁目' }
    building_name    { 'ビル' }
    telephone_number  { '09012345678' }
  end
end

