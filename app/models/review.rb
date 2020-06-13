class Review < ApplicationRecord
  belongs_to :courgette
  validates :content, presence: true
end
