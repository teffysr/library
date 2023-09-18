class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :editorial, presence: true
  validates :available, presence: true

  has_many :loans
  has_many :users, through: :loans
end
