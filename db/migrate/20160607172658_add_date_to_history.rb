class AddDateToHistory < ActiveRecord::Migration
  def change
  	add_column :histories, :fecha, :date
  end
end
