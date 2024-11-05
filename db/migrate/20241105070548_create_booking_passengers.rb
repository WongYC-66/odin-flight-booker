class CreateBookingPassengers < ActiveRecord::Migration[7.2]
  def change
    create_table :booking_passengers do |t|
      t.references :booking
      t.references :passenger
      t.timestamps
    end
  end
end
