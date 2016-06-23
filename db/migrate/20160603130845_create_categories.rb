class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :nombre
      t.string :cod
      t.references :sector, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
