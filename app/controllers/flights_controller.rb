class FlightsController < ApplicationController
  def index
    @flights = Flight.all
    @airports = Airport.all.map { |a| [ a.name, a.name ] }
    @num_tickets = (1..4).map { |n| [ n, n ] }
    @flight_dates = Flight.all.map { |f| [ f.start.strftime("%Y/%m/%d"), f.start.strftime("%Y%m%d") ] }

    puts ""
    puts params
    puts ""
  end
end
