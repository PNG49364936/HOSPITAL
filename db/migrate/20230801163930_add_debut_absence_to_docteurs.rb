class AddDebutAbsenceToDocteurs < ActiveRecord::Migration[6.0]
  def change
    add_column :docteurs, :debut_absence, :date
  end
end
