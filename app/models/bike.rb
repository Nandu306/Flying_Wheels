class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  has_one_attached :photo

  scope :filter_by_bike_category, -> (bike_category) { where bike_category: bike_category }

  validates :bike_category, presence: true
  validates :frame_size, presence: true
  validates :description, presence: true
  validates :rate_per_day, presence: true
end
