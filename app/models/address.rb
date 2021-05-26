class Address < ApplicationRecord
  belongs_to :profile
  belongs_to :state
end
