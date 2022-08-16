class Booking < ApplicationRecord
  enum :currency => {
    euro: 0,
    dollar: 1,
    pound: 2
  }

  validates_presence_of :hotel_name, :price, :currency, :start_date, :name, :email

  validates :price, numericality: { greater_than_or_equal_to: 0 }

  validates :end_date, comparison: { greater_than: :start_date }
end
