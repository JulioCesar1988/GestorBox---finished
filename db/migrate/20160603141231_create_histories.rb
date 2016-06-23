class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.references :user, index: true, foreign_key: true
      t.references :box, index: true, foreign_key: true
      t.text :observacion

      t.timestamps null: false
    end
  end
end
