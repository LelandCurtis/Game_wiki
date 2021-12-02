class AddLevelsToMonsters < ActiveRecord::Migration[5.2]
  def change
    add_reference :monsters, :levels, foreign_key: true
  end
end
