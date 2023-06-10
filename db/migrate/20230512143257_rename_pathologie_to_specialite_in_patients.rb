class RenamePathologieToSpecialiteInPatients < ActiveRecord::Migration[6.0]
  def change
    rename_column :patients, :pathologie, :specialite
  end
end
