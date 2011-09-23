# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080721163527) do

  create_table "categories", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.integer  "products_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "company"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.string   "address"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name",                                                           :null => false
    t.string   "code"
    t.integer  "unit_type_id",                                                   :null => false
    t.integer  "category_id",                                                    :null => false
    t.decimal  "unit_cost",      :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "unit_price",     :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "units_minimum",  :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "units_in_stock", :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "units_on_order", :precision => 10, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_tax_rates", :id => false, :force => true do |t|
    t.integer "product_id",  :null => false
    t.integer "tax_rate_id", :null => false
  end

  add_index "products_tax_rates", ["product_id", "tax_rate_id"], :name => "index_products_tax_rates_on_product_id_and_tax_rate_id"

  create_table "purchase_line_items", :force => true do |t|
    t.integer  "purchase_order_id",                                :null => false
    t.integer  "product_id",                                       :null => false
    t.decimal  "unit_cost",         :precision => 10, :scale => 2
    t.decimal  "quantity",          :precision => 10, :scale => 2
    t.decimal  "total_cost",        :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.integer  "supplier_id"
    t.boolean  "received",    :default => false
    t.boolean  "paid",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_line_items", :force => true do |t|
    t.integer  "sales_order_id",                                :null => false
    t.integer  "product_id",                                    :null => false
    t.decimal  "unit_price",     :precision => 10, :scale => 2
    t.decimal  "quantity",       :precision => 10, :scale => 2
    t.decimal  "total_price",    :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales_orders", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.integer  "customer_id"
    t.boolean  "paid",        :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "slogan"
    t.string   "currency_symbol"
    t.string   "email"
    t.string   "website"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "address"
    t.text     "policy_statement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name",         :null => false
    t.string   "contact_name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.string   "address"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tax_rates", :force => true do |t|
    t.string   "name",                                                      :null => false
    t.decimal  "percentage", :precision => 5, :scale => 2, :default => 0.0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "unit_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "enabled",                                 :default => true
    t.boolean  "is_admin",                                :default => false
  end

end
