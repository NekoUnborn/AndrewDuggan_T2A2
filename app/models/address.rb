class Address < ApplicationRecord
  has_many :profiles
  has_one :state
end
