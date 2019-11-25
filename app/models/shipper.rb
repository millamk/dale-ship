class Shipper < ApplicationRecord
  belongs_to :user
  # has_many :bookings

  validates :vol_freq
end
