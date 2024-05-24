class PagesController < ApplicationController
  def home
  end


  def dashboard
    # @offers = Offer.all
    @offers = Offer.where(user: current_user)
    @bookings = Booking.joins(:offer).where(offers: { user_id: current_user.id })
    @booked_bookings = @bookings.where(status: 'accepted')
    @pending_bookings = @bookings.where(status: 'pending')
    @my_bookings = Booking.where(user: current_user)
    @my_booked_bookings = @my_bookings.where(status: 'accepted')
    @my_pending_bookings = @my_bookings.where(status: 'pending')
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        map_html: render_to_string(partial: "shared/map", locals: {offer: offer})
      }
    end
  end

end
