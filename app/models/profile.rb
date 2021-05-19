class Profile < ApplicationRecord
  belongs_to :trades
  belongs_to :address
end
