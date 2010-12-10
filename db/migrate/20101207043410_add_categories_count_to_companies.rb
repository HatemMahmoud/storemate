class AddCategoriesCountToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :categories_count, :integer, :default => 0
  end

  def self.down
    remove_column :companies, :categories_count
  end
end
