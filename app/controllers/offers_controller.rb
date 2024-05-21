class OffersController < ApplicationController
  def index
    @offers = Offer.all
  end
  
  def new
    @offer = Offer.new
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
