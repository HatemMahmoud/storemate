class CreateSuppliers < ActiveRecord::Migration
  def self.up
    create_table :suppliers do |t|
      t.references :company
      t.string :name
      t.string :contact_person
      t.string :phone
      t.string :mobile
      t.string :email
      t.string :website
      t.string :street
      t.string :city
      t.string :postal_code
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :suppliers
  end
end
