class RemoveNomSpecialiteToPatients < ActiveRecord::Migration[6.0]
  def change
    remove_column :patients, :nom_specialite, :string
  end
end
