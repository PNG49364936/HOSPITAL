class AddDocteurIdToSpecialites < ActiveRecord::Migration[6.0]
  def change
    add_reference :specialites, :docteur, null: false, foreign_key: true
  end
end
 