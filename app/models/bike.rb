class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo

  scope :filter_by_bike_category, -> (bike_category) { where bike_category: bike_category }

  validates :bike_category, presence: true
  validates :frame_size, presence: true
  validates :description, presence: true
  validates :rate_per_day, presence: true
  validates :address, presence: true

end
