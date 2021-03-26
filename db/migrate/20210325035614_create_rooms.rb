class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :address
      t.integer :price
      t.integer :beds
      t.integer :square
      t.boolean :assigned

      t.timestamps
    end
  end
end
