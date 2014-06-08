class CreateInstruments < ActiveRecord::Migration
  def change
    create_table :instruments do |t|
      t.integer :band_id
      t.index :band_id
      t.string :manufacturer
      t.string :model
      t.date :year
      t.string :color
      t.timestamps
    end
  end
end
