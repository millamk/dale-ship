class Carrier < ApplicationRecord
  belongs_to :user
  has_many :freights

  validates :carrier_type, inclusion: { in: ['SMB Forwarder', 'Global Forwarder'] }
end
