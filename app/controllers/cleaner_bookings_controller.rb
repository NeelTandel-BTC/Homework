class CleanerBookingsController < ApplicationController
  before_action :authenticate_cleaner!

  def index
    @bookings = current_cleaner.bookings
  end

  def new
    @booking = booking
  end
  
end
