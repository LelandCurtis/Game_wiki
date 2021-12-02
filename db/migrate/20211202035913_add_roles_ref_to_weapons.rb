class AddRolesRefToWeapons < ActiveRecord::Migration[5.2]
  def change
    add_reference :weapons, :roles, foreign_key: true
  end
end
