class BuyAddress
  include ActiveModel::Model
  attr_accessor :price, :token, :user_id, :item_id, :postal_code, :delivery_from_id, :municipality, :house_number,
                :building_name, :telephone_number

  with_options presence: true do
    validates :address
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'は『3桁ハイフン4桁』半角数字で入力してください' }
    validates :municipality
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: 'は10桁以上11桁以内で入力してください' }
    validates :delivery_from_id, numericality: { other_than: 1, message: "入力してください" }
    validates :token
  end

  def address
    "#{postal_code} #{delivery_from_id} #{municipality} #{house_number} #{building_name} #{telephone_number}"
  end

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_from_id: delivery_from_id, municipality: municipality,
                   house_number: house_number, building_name: building_name, telephone_number: telephone_number, buy_id: buy.id)
  end
end
