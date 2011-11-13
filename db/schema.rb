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

ActiveRecord::Schema.define(:version => 20111110235611) do

  create_table "assets", :force => true do |t|
    t.string   "type",            :null => false
    t.integer  "attachable_id",   :null => false
    t.string   "attachable_type", :null => false
    t.string   "asset_path",      :null => false
    t.string   "content_type",    :null => false
    t.string   "file_size",       :null => false
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assets", ["attachable_id"], :name => "index_assets_on_attachable_id"
  add_index "assets", ["attachable_type"], :name => "index_assets_on_attachable_type"
  add_index "assets", ["type"], :name => "index_assets_on_type"

  create_table "clients", :force => true do |t|
    t.string   "organization"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients_services", :id => false, :force => true do |t|
    t.integer "client_id"
    t.integer "service_id"
  end

  create_table "inquiries", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "timetable"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "body"
    t.date     "publish_date"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.integer  "user_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["client_id"], :name => "index_projects_on_client_id"
  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "services", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "service_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["service_id"], :name => "index_skills_on_service_id"
  add_index "skills", ["user_id"], :name => "index_skills_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.text     "description"
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.integer  "sign_in_count",                     :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",                   :default => 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["unlock_token"], :name => "index_users_on_unlock_token", :unique => true

end
