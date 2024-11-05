class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.name, a.name ] }
    @flight_dates = Flight.all.map { |f| [ f.start.strftime("%Y/%m/%d"), f.start.strftime("%Y%m%d") ] }.to_set
    @num_tickets = (1..4).map { |n| [ n, n ] }

    puts ""
    if params[:departure_code] && params[:arrival_code] && params[:date]
      puts params if params
      departure_airport = Airport.find_by(name: params[:departure_code])
      arrival_airport = Airport.find_by(name: params[:arrival_code])

      start_of_day = Date.strptime(params[:date], "%Y%m%d")
      end_of_day = start_of_day.end_of_day

      @flights = Flight
        .where(departure_airport_id: departure_airport.id)
        .where(arrival_airport_id: arrival_airport.id)
        .where(start: start_of_day..end_of_day)
        .includes(:departure_airport, :arrival_airport)
      @ticket_count = params[:num_tickets]
    end
    puts ""
  end
end
