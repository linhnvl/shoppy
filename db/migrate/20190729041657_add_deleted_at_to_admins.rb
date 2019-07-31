class AddDeletedAtToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :deleted_at, :datetime
    add_index :admins, :deleted_at
  end
end
