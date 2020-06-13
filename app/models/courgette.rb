class Courgette < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, presence: true
  has_many :bookings
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map {|range| {from: range[0], to: range[1]} }
  end
end
