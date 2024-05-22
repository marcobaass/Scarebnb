class BookingsController < ApplicationController

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @offer = Offer.find(params[:id])
    @booking.offer = @offer
    @booking.save!
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
