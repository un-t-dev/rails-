class RemoveRoomFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reservations, :room, null: false, foreign_key: true
  end
end
