class PagesController < ApplicationController
  def home
  end


  def dashboard
    # @offers = Offer.all
    @offers = Offer.where(user: current_user)
    @bookings = Booking.where(user: current_user)
    @markers = @offers.geocoded.map do |offer|
      {
        lat: offer.latitude,
        lng: offer.longitude,
        map_html: render_to_string(partial: "shared/map", locals: {offer: offer})
      }
    end
  end

end
