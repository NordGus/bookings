class Bookings::List
  def initialize(page:, per_page:)
    @page = page
    @per_page = per_page
  end

  def run
    Booking.paginate(page: @page, per_page: @per_page)
  end
end