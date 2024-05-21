class PagesController < ApplicationController
  def home
  end

  def dashboard
    # @offers = Offer.all
    @offers = Offer.where(user: current_user)
  end
end
