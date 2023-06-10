class CreateRoomNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :room_numbers do |t|
      t.integer :numero
      t.references :chambre, foreign_key: true

      t.timestamps
    end
  end
end
