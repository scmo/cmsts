class AddIndexes < ActiveRecord::Migration
  def change
    add_index :measurements, :id, name: "measurements_id_index"
    add_index :measurements, :active, name: "measurements_active_index"
  end
end
