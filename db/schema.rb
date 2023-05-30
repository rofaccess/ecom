# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20230530150950) do

  create_table "clients", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "first_name",      :limit => 100, :null => false
    t.string   "last_name",       :limit => 100, :null => false
    t.string   "document_number", :limit => 100
    t.string   "address",         :limit => 150
    t.string   "phone",           :limit => 50
    t.integer  "client_id"
    t.integer  "user_id"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "people", ["client_id", "user_id"], :name => "index_people_on_client_id_and_user_id", :unique => true
  add_index "people", ["document_number"], :name => "index_people_on_document_number", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name",        :limit => 100,                                :null => false
    t.text     "description"
    t.decimal  "price",                      :precision => 10, :scale => 2, :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "products", ["name"], :name => "index_products_on_name", :unique => true

  create_table "sale_order_products", :force => true do |t|
    t.integer  "sale_order_id", :null => false
    t.integer  "product_id",    :null => false
    t.integer  "quantity",      :null => false
    t.decimal  "price",         :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "sale_orders", :force => true do |t|
    t.integer  "number",     :null => false
    t.datetime "sold_at",    :null => false
    t.integer  "client_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name",            :null => false
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true

  add_foreign_key "people", "clients", name: "people_client_id_fk", dependent: :delete
  add_foreign_key "people", "users", name: "people_user_id_fk", dependent: :delete

  add_foreign_key "sale_order_products", "products", name: "sale_order_products_product_id_fk"
  add_foreign_key "sale_order_products", "sale_orders", name: "sale_order_products_sale_order_id_fk"

  add_foreign_key "sale_orders", "clients", name: "sale_orders_client_id_fk"

end
