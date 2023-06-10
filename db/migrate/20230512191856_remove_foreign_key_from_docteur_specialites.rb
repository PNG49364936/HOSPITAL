class RemoveForeignKeyFromDocteurSpecialites < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :docteur_specialites, :docteurs
  end
end
