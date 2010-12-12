# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101212220436) do

  create_table "categories", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "products_count", :default => 0
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "categories_count", :default => 0
    t.integer  "stores_count",     :default => 0
    t.integer  "suppliers_count",  :default => 0
  end

  add_index "companies", ["name"], :name => "index_companies_on_name", :unique => true

  create_table "products", :force => true do |t|
    t.integer  "category_id"
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.decimal  "price",        :precision => 10, :scale => 2, :default => 0.0
    t.decimal  "average_cost", :precision => 10, :scale => 2, :default => 0.0
    t.integer  "quantity",                                    :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["code"], :name => "index_products_on_code"
  add_index "products", ["name"], :name => "index_products_on_name"

  create_table "purchase_orders", :force => true do |t|
    t.integer  "user_id"
    t.integer  "supplier_id"
    t.integer  "store_id"
    t.decimal  "total",       :default => 0.0
    t.datetime "received_at"
    t.datetime "paid_at"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stores", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.string   "street"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "users_count",           :default => 0
    t.integer  "purchase_orders_count", :default => 0
  end

  create_table "suppliers", :force => true do |t|
    t.integer  "company_id"
    t.string   "name"
    t.string   "contact_person"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "website"
    t.string   "street"
    t.string   "city"
    t.string   "postal_code"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "store_id"
    t.string   "name"
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
