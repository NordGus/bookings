class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :hotel_name
      t.integer :price
      t.integer :currency, null: false, default: 0
      t.date :start_date
      t.date :end_date
      t.string :name
      t.string :email

      t.timestamps
    end

    add_index :bookings, :currency
  end
end
