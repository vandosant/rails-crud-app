class RenameColorsTables < ActiveRecord::Migration
  def change
    rename_table :colors_tables, :colors
  end
end
