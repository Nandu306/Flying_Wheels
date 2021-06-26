require 'test_helper'

class BikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @user = User.new
    @bike = Bike.new(frame_size: '24D', description: 'Sturdy one', rate_per_day: 23, user: @user)
  end

  test "should be valid" do
    assert @bike.valid?
  end

  test "should not save a bike without a frame_size" do
    @bike.frame_size = ''
    assert_not @bike.valid?, "The frame size should be entered"
  end

   test "should not save a bike without a description" do
    @bike.description = ''
    assert_not @bike.valid?, "The description should be entered"
  end

   test "should not save a bike without a rate_per_day" do
    @bike.rate_per_day = ''
    assert_not @bike.valid?, "The rate per day should be entered"
  end

end
