class CreateValueTypes < ActiveRecord::Migration
  def change
    create_table :value_types do |t|
      t.text :name
      t.text :details
      t.text :unit

    end
  end
end
