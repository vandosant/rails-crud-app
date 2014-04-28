class CreateColorsTable < ActiveRecord::Migration
  def change
    create_table :colors_tables do |t|
      t.string :name
      t.boolean :primary
      t.string :spectrum
    end
  end
end
