class BookingsController < ApplicationController
  before_action :courgette_indentifier, only: [:new, :create]

  def new
    @new_booking = Booking.new
  end

  def create
    raise
    if @new_booking.save
      redirec_to #seguir aquí
    else
      render :new
    end

  end


  private

  def courgette_indentifier
    @courgette = Courgette.find(params[:courgette_id])
  end

end
