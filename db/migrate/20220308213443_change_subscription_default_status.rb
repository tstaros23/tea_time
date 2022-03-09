class ChangeSubscriptionDefaultStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_default :subscriptions, :status, from: nil, to: 0
  end
end
