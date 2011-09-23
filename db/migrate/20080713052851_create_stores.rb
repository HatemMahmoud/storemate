class CreateStores < ActiveRecord::Migration
  def self.up
    create_table :stores do |t|
      t.string :name, :null => false
      t.string :slogan
      t.string :currency_symbol
      t.string :email
      t.string :website
      t.string :phone
      t.string :mobile
      t.string :fax
      t.string :address
      t.text :policy_statement

      t.timestamps
    end
    
    Store.create(:name => 'Store Name', :currency_symbol => '$')
    
  end

  def self.down
    drop_table :stores
  end
end
