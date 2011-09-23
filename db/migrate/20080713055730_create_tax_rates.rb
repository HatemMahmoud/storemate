class CreateTaxRates < ActiveRecord::Migration
  def self.up
    create_table :tax_rates do |t|
      t.string :name,         :null => false
      t.decimal :percentage,  :precision => 5, :scale => 2, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :tax_rates
  end
end
