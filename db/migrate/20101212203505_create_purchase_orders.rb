class CreatePurchaseOrders < ActiveRecord::Migration
  def self.up
    create_table :purchase_orders do |t|
      t.references :user
      t.references :supplier
      t.references :store
      t.decimal :total, :default => 0
      t.datetime :received_at
      t.datetime :paid_at
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_orders
  end
end
