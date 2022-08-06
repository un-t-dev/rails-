class AddRoomRegistrationIdToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :room_registration_id, :integer
  end
end
