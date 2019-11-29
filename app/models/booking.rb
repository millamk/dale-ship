class Booking < ApplicationRecord
  belongs_to :shipper
  belongs_to :freight

  enum status: { approved: 'Approved', rejected: 'Rejected' }
end
