class User < ApplicationRecord
  validates :identification, presence: true
  validates :name, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_many :loans
  has_many :books, through: :loans
end
