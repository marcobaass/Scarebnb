class Offer < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many_attached :photos
  validates :title, :description, :price, :city, :address, presence: true

  include PgSearch::Model

  pg_search_scope :search_offers,
  against: [ :title, :description, :city, :address ],
  using: {
    tsearch: { prefix: true }
  }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
