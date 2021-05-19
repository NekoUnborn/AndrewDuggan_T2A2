class Profile < ApplicationRecord
  belongs_to :user
  has_one :address
  has_many :profile_trades, dependent: :destroy
  has_many :trades, through: :profile_trades

end
