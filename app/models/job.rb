class Job < ApplicationRecord
  has_many :job_trades, dependent: :destroy
  has_many :trades, through: :job_trades
  belongs_to :profile
  has_one_attached :picture
end