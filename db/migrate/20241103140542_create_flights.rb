class CreateFlights < ActiveRecord::Migration[7.2]
  def change
    create_table :flights do |t|
      t.references :departure_airport, foreign_key: { to_table: "airports" }
      t.references :arrival_airport, foreign_key: { to_table: "airports" }
      t.datetime :start     # flight departure time
      t.integer :duration   # 0.5hr, 10hr
      t.timestamps
    end
  end
end
