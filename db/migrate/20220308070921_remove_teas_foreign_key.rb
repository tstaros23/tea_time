class RemoveTeasForeignKey < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :teas, :subscriptions
  end
end
