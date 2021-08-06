class BookingsController < ApplicationController


  # def index
  #   @bookings = policy_scope(Booking).where(@booking.user.name = current_user)
  # end

  def my_bookings
    @bookings = current_user.bookings_as_owner
    authorize @bookings
  end

  def dashboard
    @bookings = current_user.bookings
    authorize @bookings
  end


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


  def update
    @booking = Booking.find(params[:id])
    if params[:status] == "0"
      @booking.accepted!
    elsif params[:status] == "1"
      @booking.rejected!
    else
      @booking.pending!
    end

    authorize @booking
    if @booking.save
      redirect_to my_bookings_path, notice: "Update successful"
    else
      render 'bikes/show'
    end


  end


  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
