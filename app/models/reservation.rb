class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room_registration
  
  validates :start_date, :end_date, :person, presence: true

  
end
