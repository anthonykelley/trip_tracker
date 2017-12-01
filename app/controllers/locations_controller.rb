class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update]

  def index
    @locations = current_user.locations
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = current_user.locations.new(account_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def udpate
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
  end

  private
    def set_account
      @location = current_user.locations.find(params[:id])
    end

    def account_params
      params.require(:location).permit(:name, :trip)
    end
end
