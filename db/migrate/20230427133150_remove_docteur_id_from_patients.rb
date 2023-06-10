class RemoveDocteurIdFromPatients < ActiveRecord::Migration[6.0]
  class RemoveDocteurIdFromPatients < ActiveRecord::Migration[6.0]
    def change
      remove_column :patients, :docteur_id, :bigint
    end
  end
end
