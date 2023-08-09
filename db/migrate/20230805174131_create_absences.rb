class CreateAbsences < ActiveRecord::Migration[6.0]
  def change
    create_table :absences do |t|
      t.date :debut_absence
      t.date :fin_absence
      t.references :docteur, null: false, foreign_key: true

      t.timestamps
    end
  end
end
