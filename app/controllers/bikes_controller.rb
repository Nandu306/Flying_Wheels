class BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @bikes = policy_scope(Bike)
  end

end
