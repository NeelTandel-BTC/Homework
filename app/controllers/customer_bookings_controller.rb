class CustomerBookingsController < ApplicationController
  before_action :authenticate_customer!
  

  def index
    @bookings = current_customer.bookings
  end

  def new
    @booking = current_customer.bookings.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def edit

  end

  def create
    @booking = current_customer.bookings.new(booking_params)
    city_cleaners = current_customer.city.cleaners
    bookings = city_cleaners.map { |cleaner| cleaner.bookings }.flatten!
    city_cleaner_ids = city_cleaners.ids
    # asd
    # bookings.select(@booking.)
    binding.pry
    @booking.cleaner_id = free_cleaners.sample
    if @booking.save
      redirect_to customer_bookings_path
    else
      flash[:alert] = @booking.errors.full_messages.join(',') 
      render 'new'
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time)
  end
end


# free_cleaners.where.not('start_time between :start_time AND :end_time AND 
#   end_time between :start_time AND :end_time, x, y)
