class CreatePurchaseOrders < ActiveRecord::Migration
  def self.up
    create_table :purchase_orders do |t|
      t.references :user, :null => false
      t.references :supplier
      t.boolean :received,  :default => false
      t.boolean :paid,      :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_orders
  end
end
