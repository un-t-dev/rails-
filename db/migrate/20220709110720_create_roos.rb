class CreateRoos < ActiveRecord::Migration[6.0]
  def change
    create_table :roos do |t|
      t.string :room_name
      t.string :introduction
      t.integer :room_price
      t.string :room_erea
      t.binary :image

      t.timestamps
    end
  end
end
