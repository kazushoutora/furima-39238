class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :image,               presence: true
  validates :item_name,           presence: true,
  validates :item_description,    presence: true,
  validates :category_id,         presence: true, 
  validates :condition_id,        presence: true, 
  validates :delivery_charges_id, presence: true, 
  validates :delivery_from_id,    presence: true, 
  validates :delivery_time_id,    presence: true, 
  validates :price,               presence: true,

  
  has_one_attached :image
  belongs_to :user
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_charges_id
  belongs_to :delivery_from_id
  belongs_to :delivery_time_id
end
