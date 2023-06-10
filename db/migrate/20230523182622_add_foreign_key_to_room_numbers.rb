class AddForeignKeyToRoomNumbers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :room_numbers, :chambres, column: :chambre_id
  end
end
