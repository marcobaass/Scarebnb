class Offer < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, :images, :description, :price, :city, :address, presence: true
end
