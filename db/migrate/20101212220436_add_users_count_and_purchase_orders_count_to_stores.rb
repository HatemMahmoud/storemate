class AddUsersCountAndPurchaseOrdersCountToStores < ActiveRecord::Migration
  def self.up
    add_column :stores, :users_count, :integer, :default => 0
    add_column :stores, :purchase_orders_count, :integer, :default => 0
  end

  def self.down
    remove_column :stores, :purchase_orders_count
    remove_column :stores, :users_count
  end
end
