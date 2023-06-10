class AddSpecialiteToDocteurs < ActiveRecord::Migration[6.0]
  def change
    add_reference :docteurs, :specialite, null: false, foreign_key: true
  end
end
