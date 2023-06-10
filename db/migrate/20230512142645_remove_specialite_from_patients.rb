class RemoveSpecialiteFromPatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :specialite, :string
  end
end
