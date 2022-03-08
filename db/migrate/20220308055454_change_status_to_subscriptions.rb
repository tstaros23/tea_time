class ChangeStatusToSubscriptions < ActiveRecord::Migration[5.2]
  def change
    remove_column :subscriptions, :status
    add_column :subscriptions, :status, :integer
    change_column_default :subscriptions, :status, :default => 0
  end
end
