class AddHospitalizationDatesToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :start_date, :datetime
    add_column :patients, :end_date, :datetime
  end
end
