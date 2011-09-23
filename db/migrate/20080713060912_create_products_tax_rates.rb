class CreateProductsTaxRates < ActiveRecord::Migration
  def self.up
    create_table :products_tax_rates, :id => false do |t|
      t.references :product,  :null => false
      t.references :tax_rate, :null => false
    end
    add_index :products_tax_rates, [:product_id, :tax_rate_id]
  end

  def self.down
    drop_table :products_tax_rates
  end
end
