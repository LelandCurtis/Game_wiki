class CreateLevel < ActiveRecord::Migration[5.2]
  def change
    create_table :levels do |t|
      t.string :name
      t.boolean :boss
      t.integer :difficulty

      t.timestamps
    end
  end
end
