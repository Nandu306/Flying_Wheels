class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  enum status: [:accepted, :rejected, :pending]

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :start_date_cannot_be_greater_than_end_date

  validate :bike_owner_cannot_book_his_own_bike

  private

  def start_date_cannot_be_greater_than_end_date
    if start_date > end_date
      errors.add(:start_date, "cannot be after the end date")
    end
  end

  def bike_owner_cannot_book_his_own_bike
    if self.user == bike.user
      errors.add(:status, "You can't book your own bike")
    end
  end

end
