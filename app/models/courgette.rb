class Courgette < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, presence: true
  has_many :bookings
end
