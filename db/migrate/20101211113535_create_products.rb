class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.references :category
      t.string :code
      t.string :name
      t.text :description
      t.decimal :price, :precision => 10, :scale => 2, :default => 0
      t.decimal :average_cost, :precision => 10, :scale => 2, :default => 0
      t.integer :quantity, :default => 0

      t.timestamps
    end
    add_index :products, :code
    add_index :products, :name
  end

  def self.down
    drop_table :products
  end
end
