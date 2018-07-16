class ChangeDefaultRewardStatus < ActiveRecord::Migration[5.1]
  def change
    change_column_default :rewards, :status, 0
  end
end
