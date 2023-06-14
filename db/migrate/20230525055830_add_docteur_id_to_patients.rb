class AddDocteurIdToPatients < ActiveRecord::Migration[6.0]
    def change
        add_reference :patients, :docteur, null: false, foreign_key: true
      end
end
