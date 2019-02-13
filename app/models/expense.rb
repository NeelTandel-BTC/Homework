# expense model
class Expense < ApplicationRecord
  validates :detail, :price, presence: true
  has_one_attached :image, dependent: :purge_now
end
