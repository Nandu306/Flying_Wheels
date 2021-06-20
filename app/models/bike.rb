class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :type, presence: true
  validates :frame_size, presence: true
  validates :description, presence: true
  validates :rent_per_day, presence: true
end
