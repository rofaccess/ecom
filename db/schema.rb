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

ActiveRecord::Schema.define(:version => 20230528151445) do

  create_table "clients", :force => true do |t|
    t.integer  "person_id",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "clients", ["person_id"], :name => "index_clients_on_person_id", :unique => true

  create_table "people", :force => true do |t|
    t.string   "first_name",      :limit => 100, :null => false
    t.string   "last_name",       :limit => 100, :null => false
    t.string   "document_number", :limit => 100, :null => false
    t.string   "address",         :limit => 150, :null => false
    t.string   "phone",           :limit => 50,  :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "people", ["document_number"], :name => "index_people_on_document_number", :unique => true

  create_table "products", :force => true do |t|
    t.string   "name",        :limit => 100,                                :null => false
    t.text     "description"
    t.decimal  "price",                      :precision => 10, :scale => 2, :null => false
    t.datetime "created_at",                                                :null => false
    t.datetime "updated_at",                                                :null => false
  end

  add_index "products", ["name"], :name => "index_products_on_name", :unique => true

  add_foreign_key "clients", "people", name: "clients_person_id_fk", dependent: :delete

end
