class CreateStations < ActiveRecord::Migration
  def change
    create_table :stations do |t|
      t.text :name
      t.text :details
      t.text :location
    end
  end
end
