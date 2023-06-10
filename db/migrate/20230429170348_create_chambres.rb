class CreateChambres < ActiveRecord::Migration[6.0]
  def change
    create_table :chambres do |t|
      t.integer :numero
      t.text :commentaires
      t.boolean :disponible, default: true
      t.timestamps
    end
  end
end
