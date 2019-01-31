class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner
  validate :booking_time_cannot_be_in_the_past

  def booking_time_cannot_be_in_the_past
    if booking_time.present? && booking_time < Time.current
      errors.add(:booking_time, "can't be in the past")
    end
  end
end
