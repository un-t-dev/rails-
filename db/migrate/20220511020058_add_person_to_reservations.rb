class AddPersonToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :person, :integer
  end
end
