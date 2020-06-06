class BookingsController < ApplicationController
  before_action :courgette_indentifier, only: [:new, :create]

  def new
    @new_booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.courgette = @courgette
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path
    else
      redirect_to courgette_path(@courgette)
    end

  end

  def index
    @bookings = current_user.bookings

  end


  private

  def courgette_indentifier
    @courgette = Courgette.find(params[:courgette_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
