class Carrier < ApplicationRecord
  belongs_to :user
  has_many :freights

  validates :CNPJ, numericality: { only_integer: true }
  validates :carrier_type, inclusion: { in: ['SMB Forwarder', 'Global Forwarder'] }
end
