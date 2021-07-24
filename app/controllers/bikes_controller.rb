class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @bikes = policy_scope(Bike)
    @bikes = policy_scope(Bike).filter_by_bike_category(params[:bike_category]) if params[:bike_category].present?
  end

  def show
    @bike = Bike.find(params[:id])
    authorize @bike
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
