class RemoveSpecialiteFromDocteur < ActiveRecord::Migration[6.0]
  def change
    def change
      remove_column :docteurs, :specialite, :string
      add_reference :docteurs, :specialite, null: false, foreign_key: true
    end
  end
end
