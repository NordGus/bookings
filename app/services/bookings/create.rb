class Bookings::Create
  def initialize(params:)
    @params = params
  end

  def run
    booking = Booking.new(@params)

    booking.save

    booking
  end
end