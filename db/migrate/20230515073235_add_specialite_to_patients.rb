class AddSpecialiteToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :specialite, :string
  end
end
