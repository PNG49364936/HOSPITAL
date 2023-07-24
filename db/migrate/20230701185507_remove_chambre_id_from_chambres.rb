class RemoveChambreIdFromChambres < ActiveRecord::Migration[6.0]
  def change
    remove_column :chambres, :chambre_id, :integer
  end
end
