class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :person, presence: true
  
  def date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
    end
    if end_date.present? && end_date < Date.today
    end
  end
  
end
