class Freight < ApplicationRecord
  belongs_to :carrier
  has_many :bookings, dependent: :destroy
  has_many :shippers, through: :bookings, dependent: :destroy

  scope :start, ->(origin) { where('origin ILIKE ?', origin) }
  scope :finish, ->(destination) { where('destination ILIKE ?', destination) }
  scope :ready, ->(load_date) { where('ready_to_load >= ?', load_date) }
  scope :type, ->(type_of_shipment) { where 'type_of_shipment ILIKE ?', type_of_shipment }
  scope :not_expired, -> { where 'expire_date >= ?', DateTime.now.to_date }

  validates :origin, presence: { in: ['name', 'address'] }
  validates :destination, presence: { in: ['name', 'address'] }
  validates :type_of_shipment, presence: true
  validates :ready_to_load, presence: true
  validates :container_pack, presence: true
  validates :carrier_id, presence: true
  validates :expire_date, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
