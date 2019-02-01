class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :cleaner
  validate :start_time_cannot_be_in_the_past
  before_validation :change_start_end_time

  def start_time_cannot_be_in_the_past
    if start_time.present? && start_time < Time.current
      errors.add(:start_time, "can't be in the past")
    end
  end


  def change_start_end_time
    self.start_time = start_time.change(day: date.day, month: date.month, year: date.year)
    self.end_time = end_time.change(day: date.day, month: date.month, year: date.year)
  end
end
