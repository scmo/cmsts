class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :measurements, :value_types, on_update: :cascade
    add_foreign_key :measurements, :stations, on_update: :cascade
  end
end
