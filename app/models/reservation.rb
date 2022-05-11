class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  def total
    greenhouse.room * person * (self.end_date - start_date).to_i
  end
  
end
