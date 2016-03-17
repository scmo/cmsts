class ChangeNotNull < ActiveRecord::Migration
  def change
    change_column_null :measurements, :measured_value, false
    change_column_null :value_types, :name, false
    change_column_null :stations, :name, false
  end
end