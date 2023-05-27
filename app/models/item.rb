class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_charges_id
  belongs_to :delivery_from_id
  belongs_to :delivery_time_id
end
