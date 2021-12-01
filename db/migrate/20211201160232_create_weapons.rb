class CreateWeapons < ActiveRecord::Migration[5.2]
  def change
    create_table :weapons do |t|
      t.integer :role_id
      t.string :name
      t.boolean :ranged_attack
      t.integer :fire_rate
      t.integer :damage

      t.timestamps
    end
  end
end
