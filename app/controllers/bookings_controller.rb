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
      redirect_to bookings_path(@booking)
      flash[:notice] = "🎊🎊🎊 Yay! Courgette booking successfully created! 🎊🎊🎊"
    else
      redirect_to courgette_path(@courgette)
    end

  end

  def index
    # raise
    @bookings = current_user.bookings
    @current_bookings = @bookings.select {|booking| booking.end_date >= Date.today }
    @past_bookings = @bookings.select {|booking| booking.end_date < Date.today }

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end


  private

  def courgette_indentifier
    @courgette = Courgette.find(params[:courgette_id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
