class CreateSalesOrders < ActiveRecord::Migration
  def self.up
    create_table :sales_orders do |t|
      t.references :user, :null => false
      t.references :customer
      t.boolean :paid, :default => false 

      t.timestamps
    end
  end

  def self.down
    drop_table :sales_orders
  end
end
