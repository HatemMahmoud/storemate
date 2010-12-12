class AddStoresCountAndSuppliersCountToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :stores_count, :integer, :default => 0
    add_column :companies, :suppliers_count, :integer, :default => 0
  end

  def self.down
    remove_column :companies, :suppliers_count
    remove_column :companies, :stores_count
  end
end
