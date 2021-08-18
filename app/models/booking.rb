class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  enum status: [:Accepted, :Rejected, :Pending]

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_cannot_be_greater_than_end_date

  validate :cannot_book_bike_for_less_than_one_day

  validate :bike_owner_cannot_book_his_own_bike


  def total_price
    number_of_days = (end_date - start_date).to_i
    total_price = ((bike.rate_per_day) * number_of_days).round(1)
  end

  private

  def start_date_cannot_be_greater_than_end_date
    if start_date > end_date
      errors.add(:start_date, "cannot be after the end date")
    end
  end

  def cannot_book_bike_for_less_than_one_day
    if end_date == start_date
      errors.add(:end_date, "cannot be same as the start date")
    end
  end

  def bike_owner_cannot_book_his_own_bike
    if self.user == bike.user
      errors.add(:status, "You can't book your own bike")
    end
  end

end
