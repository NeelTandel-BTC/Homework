class City < ApplicationRecord
  has_many :cleaners
  has_many :customers
end
