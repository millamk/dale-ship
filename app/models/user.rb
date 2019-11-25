class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true, length: { minimum: 14 }
  validates :job_title, presence: true
  validates :company_name, presence: true
  validates :user_type, presence: true
end
