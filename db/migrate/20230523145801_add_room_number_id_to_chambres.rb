class AddRoomNumberIdToChambres < ActiveRecord::Migration[6.0]
  def change
    add_column :chambres, :Room_number_id, :integer
  end
end
