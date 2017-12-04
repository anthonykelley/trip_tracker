class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy,
                                  :find_location, :add_location, :remove_from_trip]

  def index
    @trip = current_user.trips.order(created_at: :desc)
  end

  def show
    locations = @trip.locations
    @hash = Gmaps4rails.build_markers(locations) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.description
    end
  end

  def new
    @trip = current_user.trips.new
  end

  def edit
  end

  def create
    @trip = current_user.trips.create(trip_params)
    if @trip.save
      flash[:success] = "You Successfully Created A Trip!"
      redirect_to trips_path
    else
      render :new
    end
  end

  def update
    @trip = current_user.trips.find(params[:id])
    if @trip.update(trip_params)
      flash[:success] = "You updated your trip!"

      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    current_user.trips.find(params[:id]).destroy
    flash[:success] = "Trip successfully removed!"

    redirect_to trips_path
  end

  #custom controllers for adding locations

  def find_location
    @locations = Location.where('trip_id IS ?', nil).order(created_at: :desc).paginate(page: params[:page], per_page: 15)
  end

  def add_location
    @location = Location.find(params[:format])
    @location.update(trip_id: params[:id])
    flash[:success] = "Location Added!"
    redirect_to trip_path(@trip)
  end

  def remove_from_trip
    @location = Location.find(params[:trip_id])
    @location.update(trip_id: nil)
    flash[:alert] = "Location Removed!"
    redirect_to trip_path(@trip)
  end

  private
    def trip_params
      params.require(:trip).permit(:name, :days, :season, :description)
    end

    def set_trip
      @trip = current_user.trips.find(params[:id])
    end
end
