class LocationsController < ApplicationController
  before_action :find_location, only: [:edit, :show, :update, :destroy ]

  def index
    @locations = Location.all.order(created_at: :desc).paginate(page: params[:page], per_page: 15)
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
      flash[:success] = "You added a location!"

      redirect_to locations_path
    else
      render :new
    end
  end

  def update
    if @location.update(location_params)
      flash[:success] = "Location Updated!"

      redirect_to locations_path
    else
      render :edit
    end
  end

  def destroy
    @location.destroy
    flash[:success] = "Location removed!"

    redirect_to locations_path
  end

  private


    def find_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:address, :name, :country, :description)
    end
end
