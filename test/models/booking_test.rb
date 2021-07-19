require 'test_helper'

class BookingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 def setup
  @user = User.new(name: 'Peter', address: '123 Lane, London')
  @another_user = User.new(name: 'John', address: '123 Lane, Edinburgh')
  @bike = Bike.new(bike_category: 'mountain', frame_size: '23C', description: 'Sturdy one', rate_per_day: 23, user: @user)
  @booking = Booking.new(start_date: '01/02/2021', end_date: '10/02/2021', status: 'accepted', user: @another_user, bike: @bike)
end

test "should be valid" do
  assert @booking.valid?
end

test "bike owner cannot book his own bike" do
  @bike.user == @booking.user
  assert_not @booking.valid?, "You can't book your own bike"
end

end
