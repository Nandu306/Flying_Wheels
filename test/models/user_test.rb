require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  def setup
    @user = User.new(name: 'John', address: '123 Lane, London', email: 'john@gmail.com', password: 'qwerty')
  end

  test "should be valid" do
    assert @user.valid?
  end


   test "should always have an address present" do
    @user.address = ''
    assert_not @user.valid?, "Saved user without an address"
  end

   test "should always have a name present" do
    @user.name = ''
    assert_not @user.valid?, "Saved user without a name"
  end

  test "name should always be unique" do
    duplicate_user =@user.dup
    @user.save
    assert_not duplicate_user.valid?
    # user_1 = User.new(name: 'Peter')
    # user_2 = User.new(name: 'Peter')
    # user_1.name == user_2.name
    # assert_not user_1.valid?
  end
end
