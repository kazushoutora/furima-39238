class Delivery_charges_id < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items
end