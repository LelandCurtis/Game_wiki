class RemoveRoleIdFromWeapons < ActiveRecord::Migration[5.2]
  def change
    remove_column :weapons, :role_id, :integer
  end
end
