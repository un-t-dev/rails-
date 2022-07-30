class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :
  
  validates :start_date, :end_date, :person, presence: true

  
end
