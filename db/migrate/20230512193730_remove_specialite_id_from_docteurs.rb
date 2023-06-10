class RemoveSpecialiteIdFromDocteurs < ActiveRecord::Migration[6.0]
  def change
    remove_column :docteurs, :specialite_id, :integer
  end
end
