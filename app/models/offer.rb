class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos

  validates :title, :description, :price, :city, :address, presence: true
end
