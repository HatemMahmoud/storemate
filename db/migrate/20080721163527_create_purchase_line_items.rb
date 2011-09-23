class CreatePurchaseLineItems < ActiveRecord::Migration
  def self.up
    create_table :purchase_line_items do |t|
      t.references :purchase_order, :null => false
      t.references :product,        :null => false
      t.decimal :unit_cost,        :precision => 10, :scale => 2
      t.decimal :quantity,         :precision => 10, :scale => 2
      t.decimal :total_cost,       :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :purchase_line_items
  end
end
