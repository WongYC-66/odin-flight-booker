# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
puts "seeding starting ..."


puts "seeding airport model"
airport_list = [ "LAX", "PEK", "HKG", "SIN", "DXB", "MIA" ]
airport_list.each do |airport_name|
  Airport.find_or_create_by!(name: airport_name)
end

puts "seeding flight model"
airport_list.each do |a1|
  airport_list.each do |a2|
    next if a1 == a2
    (1...5).each do |n|
      flight = Flight.new
      flight.departure_airport = Airport.find_by(name: a1)
      flight.arrival_airport = Airport.find_by(name: a2)

      flight.start = Time.now + 60 * 60 * 24 * n
      flight.duration = 0.5 + n
      flight.save
    end
  end
end

puts "seeding passenger"
passenger_list = [ "Amy", "Bob", "Carlos", "Dickson", "Ellis", "Falcon", "Gary" ]
passenger_list.each do |name|
  Passenger.find_or_create_by!(name: name, email: "#{name}@example.com")
end


puts "seeding completed"
