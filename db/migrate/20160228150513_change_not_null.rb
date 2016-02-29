class ChangeNotNull < ActiveRecord::Migration
  def change
    change_column_null :measurements, :station_id, false
    change_column_null :measurements, :value_type_id, false
    change_column_null :measurements, :measured_at, false
    change_column_null :measurements, :measured_value, false
    change_column_null :value_types, :name, false
    change_column_null :stations, :name, false
  end
end
