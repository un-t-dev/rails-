class RemoveUserFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reservations, :User, null: false, foreign_key: true
  end
end
