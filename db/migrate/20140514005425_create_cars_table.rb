class CreateCarsTable < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.integer :year
      t.string :engine
      t.boolean :turbocharged
    end
  end
end
