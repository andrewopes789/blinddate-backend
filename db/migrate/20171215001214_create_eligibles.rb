class CreateEligibles < ActiveRecord::Migration[5.1]
  def change
    create_table :eligibles do |t|
      t.integer :user_id, null: false
      t.integer :eligible_id, null: false

      t.timestamps
    end
  end
end
