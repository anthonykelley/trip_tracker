class LocationsController < ApplicationController
  # before_action :find_trip
  before_action :find_location, only: [:edit, :show, :update, :destroy ]

  def index
    @locations = Location.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    redirect_to locations_path
  end

  private
    # def find_trip
    #   @trip = Trip.find(params[:trip_id])
    # end

    def find_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:address, :priority, :name, :country)
    end
end
