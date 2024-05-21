class Offer < ApplicationRecord
  belongs_to :user

  validates :title, :images, :description, :price, :city, :address, presence: true
end
