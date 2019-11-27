class Booking < ApplicationRecord
  belongs_to :shipper
  belongs_to :freight
end
