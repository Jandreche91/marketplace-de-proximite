class CourgettesController < ApplicationController
  before_action :set_courgette, only: [:show, :edit, :update, :destroy]

  def index
    @courgettes = Courgette.all
  end

  def show
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
