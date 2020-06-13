class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, :first_name, :last_name, :address, :phone_number, presence: true
  has_many :courgettes, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_owner, through: :courgettes, source: :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_one_attached :photo
  has_many :reviews_as_owner, through: :courgettes, source: :reviews
end
