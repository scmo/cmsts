class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations, :id => false do |t|
      t.column :id, :serial4, primary_key: true
      t.text :name
      t.text :details
      t.text :location
    end
  end
end
