class Address < ApplicationRecord
  belongs_to :profile
  has_one :state
end
