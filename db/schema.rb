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

ActiveRecord::Schema.define(:version => 20130702041204) do

  create_table "avatars", :force => true do |t|
    t.string  "image"
    t.string  "name"
    t.integer "user_id"
  end

  create_table "blog_posts", :force => true do |t|
    t.string   "title",       :null => false
    t.string   "body",        :null => false
    t.integer  "painting_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id",     :null => false
  end

  create_table "cart_items", :force => true do |t|
    t.integer "product_id", :null => false
    t.integer "cart_id"
    t.float   "price"
    t.string  "name"
    t.integer "user_id"
  end

  create_table "carts", :force => true do |t|
    t.integer "user_id"
    t.integer "total_price"
  end

  create_table "categories", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.integer "featured_painting_id"
  end

  create_table "order_transactions", :force => true do |t|
    t.integer  "order_id",      :null => false
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "cart_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "total_price"
    t.string   "city"
    t.string   "address"
    t.string   "name"
    t.string   "state"
    t.string   "country"
    t.integer  "zip_code"
  end

  create_table "paintings", :force => true do |t|
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "paintable_type",   :limit => 50
    t.integer  "paintable_id"
    t.boolean  "home"
    t.integer  "category_id"
    t.boolean  "primary_painting",               :default => false
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
  end

  create_table "products", :force => true do |t|
    t.string  "name",                                   :null => false
    t.text    "description"
    t.decimal "price",                                  :null => false
    t.string  "size",                                   :null => false
    t.integer "user_id"
    t.integer "category_id"
    t.integer "primary_painting_id"
    t.boolean "sold",                :default => false
    t.integer "cart_item_id"
  end

  add_index "products", ["description"], :name => "index_products_on_description"
  add_index "products", ["id"], :name => "index_products_on_id"
  add_index "products", ["name"], :name => "index_products_on_name"

  create_table "users", :force => true do |t|
    t.string   "name",                                    :null => false
    t.string   "email",           :default => "no email"
    t.string   "username",                                :null => false
    t.integer  "age"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "password_digest"
    t.boolean  "admin"
    t.string   "user_link"
  end

end
