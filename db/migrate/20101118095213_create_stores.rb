class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.integer :company_id
      t.string :name
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
    drop_table :stores
  end
end
