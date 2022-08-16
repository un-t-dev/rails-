class AddUserIdToRoomRegistrations < ActiveRecord::Migration[6.0]
  def change
    add_column :room_registrations, :user_id, :integer
  end
end
