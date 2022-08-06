class Bookings::Update
  def initialize(id:, params:)
    @id = id
    @params = params
  end

  def run
    booking = Booking.find(@id)

    booking.update(@params)

    booking
  end
end