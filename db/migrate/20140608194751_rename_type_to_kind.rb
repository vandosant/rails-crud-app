class RenameTypeToKind < ActiveRecord::Migration
  def change
    rename_column :instruments, :type, :kind
  end
end
