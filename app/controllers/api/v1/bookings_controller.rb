class Api::V1::BookingsController < ApiController
  def index
    @bookings = ::Bookings::List.new(page: page, per_page: params[:per_page]).run

    render json: { bookings: @bookings, meta: { page: page, per_page: per_page } }
  end

  def create
    @booking = ::Bookings::Create.new(params: booking_params).run

    if @booking.errors.any?
      render json: { booking: @booking, errors: @booking.errors.details }
    else
      render json: @booking
    end
  end

  def update
    @booking = ::Bookings::Update.new(id: params[:id], params: booking_params).run

    if @booking.errors.any?
      render json: { booking: @booking, errors: @booking.errors.details }
    else
      render json: @booking
    end
  end

  def destroy
    @booking = Booking.find(id: params[:id])

    @booking.destroy

    render json: @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:hotel_name, :price, :currency, :start_date, :end_date, :name, :email)
  end
end