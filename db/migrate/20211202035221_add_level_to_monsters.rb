class AddLevelToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_reference :monsters, :level, foreign_key: true
  end
end
