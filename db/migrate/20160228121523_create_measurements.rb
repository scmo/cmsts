class CreateMeasurements < ActiveRecord::Migration
  def change
    create_table :measurements, :id => false do |t|
      t.column :id, :serial8
      t.references :station
      t.references :value_type
      t.timestamp :measured_at
      t.float :measured_value
      t.boolean :active, :default => true
    end
  end
end
