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

ActiveRecord::Schema.define(:version => 20130310040919) do

  create_table "attachments", :force => true do |t|
    t.string   "status"
    t.integer  "product_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "item_file_name"
    t.string   "item_content_type"
    t.integer  "item_file_size"
    t.datetime "item_updated_at"
  end

  add_index "attachments", ["product_id"], :name => "index_attachments_on_product_id"

  create_table "comments", :force => true do |t|
    t.integer  "commentable_id",   :default => 0
    t.string   "commentable_type", :default => ""
    t.string   "title",            :default => ""
    t.text     "body",             :default => ""
    t.string   "subject",          :default => ""
    t.integer  "user_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.integer  "rating"
    t.string   "subtype"
    t.integer  "lead_id"
  end

  add_index "comments", ["commentable_id"], :name => "index_comments_on_commentable_id"
  add_index "comments", ["lead_id"], :name => "index_comments_on_lead_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "images", :force => true do |t|
    t.integer  "product_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "cover_file_name"
    t.string   "cover_content_type"
    t.integer  "cover_file_size"
    t.datetime "cover_updated_at"
  end

  add_index "images", ["product_id"], :name => "index_images_on_product_id"

  create_table "leads", :force => true do |t|
    t.string   "email"
    t.string   "token"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "username"
  end

  add_index "leads", ["email"], :name => "index_leads_on_email", :unique => true
  add_index "leads", ["token"], :name => "index_leads_on_token", :unique => true

  create_table "payments", :force => true do |t|
    t.string   "access_token"
    t.string   "publishable_key"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "payments", ["user_id"], :name => "index_payments_on_user_id"

  create_table "products", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.string   "permalink"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "price_in_cents"
    t.string   "sample_file_name"
    t.string   "sample_content_type"
    t.integer  "sample_file_size"
    t.datetime "sample_updated_at"
  end

  add_index "products", ["permalink"], :name => "index_products_on_permalink", :unique => true
  add_index "products", ["user_id"], :name => "index_products_on_user_id"

  create_table "transactions", :force => true do |t|
    t.integer  "product_id"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "transactions", ["email"], :name => "index_transactions_on_email"
  add_index "transactions", ["product_id"], :name => "index_transactions_on_product_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "bio"
    t.string   "username"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
