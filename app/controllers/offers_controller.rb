class OffersController < ApplicationController
  def index
    @offers_all = Offer.all
  end

  def new
    @offer = Offer.new
  end

  def show
    @booking = Booking.new
    @offer = Offer.find(params[:id])
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

  private

  def offer_params
    params.require(:offer).permit(:title, :images, :description, :price, :city, :address)
  end

end
