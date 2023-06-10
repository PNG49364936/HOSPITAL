class AddNomSpecialiteToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :nom_specialite, :string
  end
end
