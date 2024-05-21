class OffersController < ApplicationController
  def new
    @offer = Offer.new
  end

  def create
    @offer = Offer.new(params[:offer])
    if @offer.save
    redirect_to_offer_path(@offer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:title, :images, :description, :price, :city, :address)
  end
end
