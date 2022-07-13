class Room < ApplicationRecord
  
  belongs_to :user
  
  has_many :reservations
  
  has_many_attached :photos
  has_rich_text :description
  
end
