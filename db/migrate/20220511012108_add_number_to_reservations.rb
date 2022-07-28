class AddNumberToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :number, :integer
  end
end
