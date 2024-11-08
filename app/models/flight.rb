class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  has_many :bookings
  has_many :passengers, through: :bookings

  # accepts_nested_attributes_for :bookings, :passengers, :departure_airport, :arrival_airport
  accepts_nested_attributes_for :bookings, :passengers, :departure_airport, :arrival_airport
end
