class RemoveRoomNumberIdFromChambres < ActiveRecord::Migration[6.0]
  def change
    remove_column :chambres, :room_number_id, :integer
  end
end
