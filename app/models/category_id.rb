class Category_id < ActiveHash::Base
   include ActiveHash::Associations
   has_many :items
end