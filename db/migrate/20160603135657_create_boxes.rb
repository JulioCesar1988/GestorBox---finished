class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.text :descripcion
      t.references :sector, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.string :codigo
      t.string :ubicacion
      t.string :precinto_A
      t.string :precinto_B
      t.date :fecha

      t.timestamps null: false
    end
  end
end
