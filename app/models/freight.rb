class Freight < ApplicationRecord
  belongs_to :carrier
  # has_many :bookings, dependent: :destroy

  validates :origin, presence: { in: ['name', 'address'] }
  validates :destination, presence: { in: ['name', 'address'] }
  validates :type_of_shipment, presence: true
  validates :container_pack, presence: true
  validates :carrier_id, presence: true
  validates :expire_date, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
