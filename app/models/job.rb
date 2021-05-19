class Job < ApplicationRecord
  has_many :job_trades, dependent: :destroy
  has_many :trades, through: :job_trades
  has_one :profile
end
