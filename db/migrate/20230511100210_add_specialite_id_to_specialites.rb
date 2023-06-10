class AddSpecialiteIdToSpecialites < ActiveRecord::Migration[6.0]
  def change
    add_reference :specialites, :specialite, null: false, foreign_key: true
  end
end
