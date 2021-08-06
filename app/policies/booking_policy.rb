class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def my_bookings?
    return true
  end

  def dashboard?
    return true
  end

  def update?
    return true
  end
end
