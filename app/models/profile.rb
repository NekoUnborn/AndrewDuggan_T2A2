class Profile < ApplicationRecord
  belongs_to :user
  has_one :address, dependent: :destroy
  has_many :profile_trades, dependent: :destroy
  has_many :trades, through: :profile_trades
  has_many :jobs, dependent: :destroy
end
