class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]  

  def index
    @trip = current_user.trips
  end

  def show
  end

  def new
    @trip = current_user.trips.new
  end

  def edit
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.save
      redirect_to trips_path
    else
      render :new
    end
  end

  def update
    @trip = current_user.trips.find(params[:id])
    if @trip.update(trip_params)
      redirect_to trip_path(@trip)
    else
      render :edit
    end    
  end

  def destroy
    current_user.trips.find(params[:id]).destroy
    redirect_to trips_path
  end

  private
    def trip_params
      params.require(:trip).permit(:name, :days, :season)
    end

    def set_trip
      @trip = current_user.trips.find(params[:id])
    end
end
