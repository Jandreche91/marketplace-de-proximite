class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :first_name, :last_name, :address, :city_name, :city_postcode, :phone_number, presence: true
  has_many :courgettes, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_owner, through: :courgettes, source: :bookings
end
