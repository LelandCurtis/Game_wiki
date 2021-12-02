class AddRoleRefToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :role, foreign_key: true
  end
end
