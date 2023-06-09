class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image,               presence: true
  validates :item_name,           presence: true
  validates :item_description,    presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :delivery_charge_id,  presence: true
  validates :delivery_from_id,    presence: true
  validates :delivery_time_id,    presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                    presence: { message: "を入力してください" }

  belongs_to       :user
  belongs_to       :category
  belongs_to       :condition
  belongs_to       :delivery_charge
  belongs_to       :delivery_from
  belongs_to       :delivery_time
  has_one          :buy
  has_one_attached :image

  validates :category_id, :condition_id, :delivery_charge_id, :delivery_from_id, :delivery_time_id,
            numericality: { other_than: 1, message: "を入力してくだい" }
end
