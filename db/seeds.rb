# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Destroying all user entries, offers and bookings"
Booking.destroy_all
Offer.destroy_all
User.destroy_all

puts "Creating users"
User.create!(email: 'jeremy.rome93@gmail.com', password: '123456')
User.create!(email: 'clemence.lc@gmail.com', password: '123456')
User.create!(email: 'picture@marcobaass.com', password: '123456')
user = User.new(email: 'sertopico@gmail.com', password: '123456')
user.save!
puts 'Users created'

puts 'Creating new offers'
offer = Offer.new(title: "Marco's haunted house", images: "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/home-improvement/wp-content/uploads/2023/12/image29-e1701415101357.jpg", description: "Boo-hoo", price: 899.99, city: 'Berlin', address: 'Rudi Dutschi', user_id: user.id)
offer.save!

puts 'Creating bookings'
booking = Booking.new(status: 1, start_date: '2024/10/11', end_date: '2024/10/15', user_id: user.id, offer_id: offer.id)
booking.save!
