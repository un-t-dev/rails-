class ChangeRoosToRoomRegistrations < ActiveRecord::Migration[6.0]
  def change
    rename_table :roos, :room_registrations
  end
end
