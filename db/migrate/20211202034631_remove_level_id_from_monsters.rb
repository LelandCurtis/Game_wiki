class RemoveLevelIdFromMonsters < ActiveRecord::Migration[5.2]
  def change
    remove_column :monsters, :level_id, :integer
  end
end
