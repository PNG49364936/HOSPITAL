class CreateSpecialites < ActiveRecord::Migration[6.0]
  def change
    create_table :specialites do |t|
      t.string :specialite
      t.integer :patient_id
      t.timestamps
    end
  end
end
