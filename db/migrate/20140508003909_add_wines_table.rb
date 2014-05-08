class AddWinesTable < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :name
      t.string :style
      t.string :color
      t.integer :rating
    end
  end
end
