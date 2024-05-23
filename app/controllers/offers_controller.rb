class OffersController < ApplicationController
  def index
    if params[:query].present?
      @offers = Offer.search_offers(params[:query])
    else
      @offers = Offer.all
    end
  end

  def new
    @offer = Offer.new
  end

  def show
    @booking = Booking.new(offer: @offer)
    @offer = Offer.find(params[:id])

    @markers = [
      {
        lat: @offer.latitude,
        lng: @offer.longitude,
        map_html: render_to_string(partial: "shared/map", locals: {offer: @offer})
      }]
  end

  def create
    @offer = Offer.new(offer_params)
    # @offer.user_id = current_user.id
    @offer.user = current_user
    if @offer.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    if @offer.destroy
      redirect_to dashboard_path, notice: 'offer was successfully deleted.'
    else
      redirect_to dashboard_path, alert: 'offer could not be deleted.'
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :images, :description, :price, :city, :address, photos: [])
  end

end
