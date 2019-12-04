class Carrier < ApplicationRecord
  belongs_to :user
  has_many :freights, dependent: :destroy

  mount_uploader :photo, PhotoUploader
  validates :carrier_type, inclusion: { in: ['SMB Forwarder', 'Global Forwarder'] }
end
