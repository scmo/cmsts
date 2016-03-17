class CreateJoinTableStationValueType < ActiveRecord::Migration
  def change
    create_join_table :stations, :value_types do |t|
      t.index [:station_id, :value_type_id]
      t.index [:value_type_id, :station_id]
    end
    add_foreign_key :stations_value_types, :stations, on_update: :cascade, on_delete: :cascade
    add_foreign_key :stations_value_types, :value_types, on_update: :cascade, on_delete: :cascade
  end
end
