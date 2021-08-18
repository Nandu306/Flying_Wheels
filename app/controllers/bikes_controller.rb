class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @bikes = policy_scope(Bike)
    @bikes = policy_scope(Bike).filter_by_bike_category(params[:bike_category]) if params[:bike_category].present?

    if Rails.env.production?
      location_info = request.location
      @distance_away = []
       @bikes.each do |bike|
        @distance_away << Geocoder::Calculations.distance_between([location_info.latitude,location_info.longitude], [bike.latitude,bike.longitude]).round(2)
      end
    end
  end

  def show
    @bike = Bike.find(params[:id])
    authorize @bike
    @booking = Booking.new

    @markers = [
      {
        lat: @bike.latitude,
        lng: @bike.longitude,
      }
    ]

    if Rails.env.production?
      location_info = request.location
      @distance_away = Geocoder::Calculations.distance_between([location_info.latitude,location_info.longitude], [@bike.latitude,@bike.longitude]).round(2)
    end

  end

  def new
    @bike = Bike.new
    authorize @bike
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    authorize @bike
    if @bike.save
      redirect_to bike_path(@bike)
    else
      render :new
    end
  end


  private

  def bike_params
    params.require(:bike).permit(:bike_category, :frame_size, :description, :rate_per_day, :photo)
  end

end
