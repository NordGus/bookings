class BookingsController < ApplicationController
  before_action :set_booking, only: [:new, :edit, :delete, :destroy]

  def index
    @bookings = ::Bookings::List.new(page: page, per_page: params[:per_page]).run
  end

  def new; end

  def create
    @booking = ::Bookings::Create.new(params: booking_params).run

    render :new if @booking.errors.any?
  end

  def edit; end

  def update
    @booking = ::Bookings::Update.new(id: params[:id], params: booking_params).run

    render :edit if @booking.errors.any?
  end

  def delete; end

  def destroy
    @booking.destroy
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:hotel_name, :price, :currency, :start_date, :end_date, :name, :email)
  end
end