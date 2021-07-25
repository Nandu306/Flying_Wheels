class BookingsController < ApplicationController

  def create
    @bike = Bike.find(params[:bike_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.bike = @bike
    authorize @booking

    if @booking.save
      redirect_to bikes_path, notice: "Booking successful"
    else
      render 'bikes/show'
    end
  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
