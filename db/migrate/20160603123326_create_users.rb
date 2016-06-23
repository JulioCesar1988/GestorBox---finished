class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :sector, index: true, foreign_key: true
      t.string :role
      t.string :nombre
      t.string :apellido

      t.timestamps null: false
    end
  end
end
