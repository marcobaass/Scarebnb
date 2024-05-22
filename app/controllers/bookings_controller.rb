class BookingsController < ApplicationController

  def create
    @booking = Booking.new()
    @booking.start_date = params[:booking][:start_date]
    @booking.end_date = params[:booking][:end_date]
    @booking.user = current_user
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    @booking.save!
    redirect_to dashboard_path
  end

end
