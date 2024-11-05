class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @ticket_count = Integer(params[:ticket_count])

    @booking = @flight.bookings.new
    # @passengers = (1..@ticket_count).map { |n| Passenger.build }
    @ticket_count.times { @booking.flight.passengers.build }
    # puts @flight.passengers
  end

  def create
    puts ""
    puts params
    puts ""
  end

  def show
  end
end
