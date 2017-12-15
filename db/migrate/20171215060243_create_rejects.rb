class CreateRejects < ActiveRecord::Migration[5.1]
  def change
    create_table :rejects do |t|
      t.integer :user_id, null: false
      t.integer :reject_id, null: false

      t.timestamps
    end
  end
end
