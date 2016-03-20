class AddMultiplePrimaryKeys < ActiveRecord::Migration
  execute "ALTER TABLE measurements ADD PRIMARY KEY (station_id,value_type_id,measured_at);"
end
