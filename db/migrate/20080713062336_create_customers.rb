class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :name, :null => false
      t.string :company
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :website
      t.string :address
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
