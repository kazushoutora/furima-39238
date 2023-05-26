class User < ApplicationRecord
  validates :nickname, presence: true
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数を両方含む必要があります'
  validates :first_name,         presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は漢字・ひらがな・カタカナで入力してください' }
  validates :last_name,          presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'は漢字・ひらがな・カタカナで入力してください' }
  validates :first_name_yomi,    presence: true, format: { with: /\A[ァ-ヶー－]+\z/,           message: '全角カタカナのみで入力して下さい' }
  validates :last_name_yomi,     presence: true, format: { with: /\A[ァ-ヶー－]+\z/,           message: '全角カタカナのみで入力して下さい' }
  validates :birth_date,         presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
