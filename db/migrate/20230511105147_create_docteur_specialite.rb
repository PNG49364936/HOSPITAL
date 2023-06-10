class CreateDocteurSpecialite < ActiveRecord::Migration[6.0]
  def change
    create_table :docteur_specialites do |t|
      t.references :docteur, null: false, foreign_key: true
      t.references :specialite, null: false, foreign_key: true
    end
  end
end
