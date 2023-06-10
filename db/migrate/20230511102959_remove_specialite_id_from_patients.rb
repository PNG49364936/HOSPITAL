class RemoveSpecialiteIdFromPatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :specialite_id, :integer
  end
end
