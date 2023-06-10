class RemoveDocteurAndChambreFromPatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :docteur, :string
    remove_column :patients, :chambre, :integer
  end
end
