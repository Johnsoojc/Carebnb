class BookingsController < ApplicationController

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.listing_id = @listing.id
    #let put listing id into booking id to find the spefic listing id for that booking. you cnan also have hidden value in the form, then you jsut params permit the listing_id
    if @booking.save
      redirect_to current_user
    else
      @errors = @booking.errors.full_messages
      render 'bookings/new'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to @booking.user
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :num_guests)
  end
end
