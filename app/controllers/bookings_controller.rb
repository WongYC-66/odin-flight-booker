class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @ticket_count = Integer(params[:ticket_count])

    @booking = @flight.bookings.new
    @ticket_count.times { @booking.passengers.build }
  end

  def create
    puts ""
    puts params
    puts ""
  end

  def show
  end
end
