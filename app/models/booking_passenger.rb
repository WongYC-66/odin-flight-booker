class BookingPassenger < ApplicationRecord
  belongs_to :booking
  belongs_to :passenger

  accepts_nested_attributes_for :booking, :passenger
end
