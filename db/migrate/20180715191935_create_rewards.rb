class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.integer :status, default: 0
      t.integer :user_id

      t.timestamps
    end
  end
end
