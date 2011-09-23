class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name,             :null => false
      t.string :code
      t.references :unit_type,    :null => false
      t.references :category,     :null => false
      t.decimal :unit_cost,       :precision => 10, :scale => 2, :default => 0
      t.decimal :unit_price,      :precision => 10, :scale => 2, :default => 0
      t.decimal :units_minimum,   :precision => 10, :scale => 2, :default => 0
      t.decimal :units_in_stock,  :precision => 10, :scale => 2, :default => 0
      t.decimal :units_on_order,  :precision => 10, :scale => 2, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
