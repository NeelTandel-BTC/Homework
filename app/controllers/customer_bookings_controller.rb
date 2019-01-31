class CustomerBookingsController < ApplicationController
  before_action :authenticate_customer!
  

  def index
  end

  def new
    @booking = current_customer.bookings.new
  end

  def create
    # binding.pry
    @booking = current_customer.bookings.new(booking_params)
    @booking.cleaner = current_customer.city.cleaners.first
    if @booking.save
      redirect_to customer_bookings_path
    else
      flash[:alert] = @booking.errors.full_messages.join(',') 
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:booking_time)
  end
end
