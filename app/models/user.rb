class User < ApplicationRecord
  
  has_many :roo
  has_many :reservations

  has_one_attached :avatar
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :full_name, presence: true
end
