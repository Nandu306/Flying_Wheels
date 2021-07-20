class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @bikes = policy_scope(Bike)
  end

  private

  # def bike_params
  #   params.require(:bike).permit(:bike_category, :frame_size, :description, :rate_per_day, :photo)
  # end

end
