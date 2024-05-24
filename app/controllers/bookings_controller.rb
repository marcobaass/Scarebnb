class BookingsController < ApplicationController

  def create
    @booking = Booking.new()
    @booking.start_date = params[:booking][:start_date]
    @booking.end_date = params[:booking][:end_date]
    @booking.user = current_user
    @offer = Offer.find(params[:offer_id])
    @booking.offer = @offer
    @booking.status = 0
    @booking.save!
    redirect_to dashboard_path
  end

  def accept
    @booking = Booking.find(params[:id])
    if @booking.accepted!
      redirect_to dashboard_path, notice: 'booking accepted'
    else
      redirect_to dashboard_path, notice: 'booking could not be accepted - please try again'
    end
  end

  def reject
    @booking = Booking.find(params[:id])
    if @booking.rejected!
      redirect_to dashboard_path, notice: 'booking rejected'
    else
      redirect_to dashboard_path, notice: 'booking could not be rejected - please try again'
    end
  end

end
