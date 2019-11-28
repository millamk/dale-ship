class Shipper < ApplicationRecord
  belongs_to :user

  validates :CNPJ, numericality: { only_integer: true }
end
