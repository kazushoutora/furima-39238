class User < ApplicationRecord
  validates :nickname,           presence: true
  validates :first_name,         presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ } 
  validates :first_name_yomi,    presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name,          presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :last_name_yomi,     presence: true, format: {with: /\A[ァ-ヶー－]+\z/ }
  validates :birth_date,         presence: true
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
