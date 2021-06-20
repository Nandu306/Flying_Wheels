class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bikes, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :bookings_as_owner, through: :bikes, source: :bookings

  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  # validates :bike_owner_cannot_book_his_own_bike

  def bike_owner_cannot_book_his_own_bike
    if bike.user == booking.user
      errors.add(:booking, "You can't book your own bike")
    end
  end
end
