class AddFinAbsenceToDocteurs < ActiveRecord::Migration[6.0]
  def change
    add_column :docteurs, :fin_absence, :date
  end
end
