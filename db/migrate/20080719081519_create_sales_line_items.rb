class CreateSalesLineItems < ActiveRecord::Migration
  def self.up
    create_table :sales_line_items do |t|
      t.references :sales_order,  :null => false
      t.references :product,      :null => false
      t.decimal :unit_price,      :precision => 10, :scale => 2
      t.decimal :quantity,        :precision => 10, :scale => 2
      t.decimal :total_price,     :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :sales_line_items
  end
end
