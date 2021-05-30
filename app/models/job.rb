class Job < ApplicationRecord
  has_many :job_trades, dependent: :destroy
  has_many :trades, through: :job_trades
  belongs_to :profile
end