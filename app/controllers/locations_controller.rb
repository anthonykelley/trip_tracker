class LocationsController < ApplicationController
  before_action :find_trip

  def index
    @locations = @trip.locations.all
  end

  def show
  end

  def new
    @location = Location.new
  end

  def edit
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      redirect_to trip_path(@trip)
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
    def find_trip
      @trip = Trip.find(params[:trip_id])
    end

    def location_params
      params.require(:location).permit(:address, :priority, :name, :country)
    end
end
