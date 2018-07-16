class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.integer :status
      t.integer :user_id

      t.timestamps
    end
  end
end
