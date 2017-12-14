class CreatePotentials < ActiveRecord::Migration[5.1]
  def change
    create_table :potentials do |t|
      t.integer :user_id, null: false
      t.integer :potential_id, null: false

      t.timestamps
    end
    add_index :potentials, %i(user_id potential_id), unique: true
  end
end
