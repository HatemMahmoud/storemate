class CreatePurchaseOrderItems < ActiveRecord::Migration
  def self.up
    create_table :purchase_order_items do |t|
      t.references :purchase_order
      t.references :product
      t.decimal :quantity, :precision => 10, :scale => 2, :default => 0
      t.decimal :cost, :precision => 10, :scale => 2, :default => 0
      t.decimal :total, :precision => 10, :scale => 2, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_order_items
  end
end
