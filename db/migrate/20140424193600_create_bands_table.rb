class CreateBandsTable < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name
      t.string :genre
      t.integer :members
    end
  end
end
