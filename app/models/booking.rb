class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bike
  enum status: [:accepted, :rejected, :pending]

  # validates :bike_owner_cannot_book_his_own_bike

  def bike_owner_cannot_book_his_own_bike
    if bike.user == self.user
      errors.add(:status, "You can't book your own bike")
    end
  end
end
