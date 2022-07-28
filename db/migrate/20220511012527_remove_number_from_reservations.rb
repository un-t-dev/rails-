class RemoveNumberFromReservations < ActiveRecord::Migration[6.0]
  def change
    remove_column :reservations, :number, :integer
  end
end
