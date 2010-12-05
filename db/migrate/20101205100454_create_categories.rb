class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.references :company
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :categories, :name, :unique => true
  end

  def self.down
    drop_table :categories
  end
end
