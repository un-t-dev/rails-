class Room < ApplicationRecord
  
  belongs_to :user
  
  has_many :reservations
  
  has_many_attached :photos
  has_rich_text :description
  
  validates :home_type, presence: true
  validates :room_type, presence: true
end
