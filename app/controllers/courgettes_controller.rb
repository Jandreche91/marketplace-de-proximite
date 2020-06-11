class CourgettesController < ApplicationController
  before_action :set_courgette, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @courgettes = Courgette.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @courgettes = Courgette.all
    end

    @users = User.geocoded # returns flats with coordinates

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        # image_url: helpers.asset_url(cl_image_tag user.photo.key),
      }
    end
  end

  def show
    @new_booking = Booking.new
  end

  def new
    @courgette = Courgette.new
  end

  def create
    @courgette = Courgette.new(courgette_params)
    if @courgette.save
      redirect_to courgettes_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @courgette.update(courgette_params)
    redirect_to courgette_path(@courgette)
  end

  def destroy
    @courgette.destroy
    redirect_to courgettes_path
  end

  private

  def set_courgette
    @courgette = Courgette.find(params[:id])
  end

  def courgette_params
    params.require(:courgette).permit(:name, :description, :price)
  end
end
