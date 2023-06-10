class RemoveSpecialiteIdFromSpecialites < ActiveRecord::Migration[6.0]
  def change
    remove_column :specialites, :specialite_id, :integer
  end
end
