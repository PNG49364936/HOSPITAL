class CreateDocteurs < ActiveRecord::Migration[6.0]
    def change
        create_table :docteurs do |t|
          t.string :nom
          t.integer :docteur_id
          
    
          t.timestamps
        end
      end
end
