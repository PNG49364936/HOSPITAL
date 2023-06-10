class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :nom
      t.string :pathologie
      t.string :docteur
      t.integer :chambre
      t.text :commentaires

      t.timestamps
    end
  end
end

