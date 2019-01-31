class CleanerBookingsController < ApplicationController
  before_action :authenticate_cleaner!
  def index
  end

  def new
    @booking = booking
  end
end
