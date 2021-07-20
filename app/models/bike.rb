class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  validates :bike_category, presence: true
  validates :frame_size, presence: true
  validates :description, presence: true
  validates :rate_per_day, presence: true
end
