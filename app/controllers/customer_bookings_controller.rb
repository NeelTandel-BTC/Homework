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
    @customer_booking = current_customer.bookings.new(booking_params)
    change_start_end_time()

    city_cleaners = current_customer.city.cleaners
    @city_cleaner_ids = city_cleaners.ids
    if !city_cleaners.empty?
      @bookings = city_cleaners.map { |cleaner| cleaner.bookings }.flatten!
      find_free_cleaner() unless @bookings.empty? 
      @customer_booking.cleaner_id = @city_cleaner_ids.sample
      binding.pry
      if @customer_booking.save
        redirect_to customer_bookings_path
      else
        flash_message 
      end  
    else
      flash_message
    end
  end

  def find_free_cleaner
    
    free_cleaners = @bookings.select do |booking|
    @city_cleaner_ids.delete(booking.cleaner_id)  if @customer_booking.start_time.between?(booking.start_time,booking.end_time) ||
                                                     @customer_booking.end_time.between?(booking.start_time,booking.end_time)       
    end
  end

  def flash_message
    flash[:alert] = @customer_booking.errors.full_messages.join(',') 
    render 'new'
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :start_time, :end_time)
  end

  def change_start_end_time()
    @customer_booking.start_time = @customer_booking.start_time.change(day:@customer_booking.date.day,mont:@customer_booking.date.month,year:@customer_booking.date.year)
    @customer_booking.end_time = @customer_booking.end_time.change(day:@customer_booking.date.day,mont:@customer_booking.date.month,year:@customer_booking.date.year)
  end
end