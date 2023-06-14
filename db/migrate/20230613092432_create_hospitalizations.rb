class CreateHospitalizations < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitalizations do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :patient, null: false, foreign_key: true
      t.references :chambre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
