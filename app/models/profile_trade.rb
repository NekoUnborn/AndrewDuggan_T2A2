class ProfileTrade < ApplicationRecord
  belongs_to :profile
  belongs_to :trade
end
