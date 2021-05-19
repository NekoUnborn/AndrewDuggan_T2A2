class Trade < ApplicationRecord
  has_many :profile_trades, dependent: :destroy
  has_many :profiles, through: :profile_trades
  has_many :job_trades, dependent: :destroy
  has_many :jobs, through: :job_trades
end
