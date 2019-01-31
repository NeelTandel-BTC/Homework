class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :booking_time
      t.references :customer, foreign_key: true
      t.references :cleaner, foreign_key: true

      t.timestamps
    end
  end
end
