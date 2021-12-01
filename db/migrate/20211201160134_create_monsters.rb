class CreateMonsters < ActiveRecord::Migration[5.2]
  def change
    create_table :monsters do |t|
      t.int :level_id
      t.string :name
      t.boolean :enraged
      t.integer :health

      t.timestamps
    end
  end
end
