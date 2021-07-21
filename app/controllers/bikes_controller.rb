class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @bikes = policy_scope(Bike)
  end

  def show
    @bike = Bike.find(params[:id])
    authorize @bike

  end

  private

  def bike_params
    params.require(:bike).permit(:bike_category, :frame_size, :description, :rate_per_day, :photo)
  end

end
