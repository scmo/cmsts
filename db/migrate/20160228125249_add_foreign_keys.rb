class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :measurements, :value_types
    add_foreign_key :measurements, :stations
  end
end
