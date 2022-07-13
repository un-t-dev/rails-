class Roo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  has_many :reservations
end
