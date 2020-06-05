class BookingsController < ApplicationController
  before_action :courgette_indentifier, only: [:new]

  def new
    @new_booking = Booking.new
  end

  def create
    raise

  end


  private

  def courgette_indentifier
    @courgette = Courgette.find(params[:courgette_id])
  end

end
