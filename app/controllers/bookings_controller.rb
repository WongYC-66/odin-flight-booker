class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight_id])
    @ticket_count = Integer(params[:ticket_count])

    @booking = @flight.bookings.new
    @ticket_count.times { @booking.passengers.build }
  end

  def create
    flight = Flight.find(params[:booking][:flight_id])
    @booking = flight.bookings.new()

    params[:booking][:passengers_attributes].each do |i, passenger|
      created_passenger = Passenger.find_or_create_by(email: passenger[:email]) do |new_p|
        new_p.name = passenger[:name]
      end
      @booking.passengers << created_passenger
    end

    if @booking.save
      @booking.passengers.each do |user|
        PassengerMailer.with(user: user, flight: flight, all_passengers: @booking.passengers).welcome_email.deliver_now
      end
      redirect_to @booking
    else
      render new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end
end
