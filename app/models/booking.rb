class Booking < ApplicationRecord
  belongs_to :shipper
  belongs_to :freight

  enum status: { pending: 'Pending', approved: 'Approved', rejected: 'Rejected' }
end
