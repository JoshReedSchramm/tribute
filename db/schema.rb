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

ActiveRecord::Schema.define(:version => 20130311033907) do

  create_table "identities", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider",             :null => false
    t.string   "uid",                  :null => false
    t.text     "omniauth_info"
    t.text     "omniauth_credentials"
    t.text     "omniauth_extra"
    t.string   "type"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "identities", ["provider", "uid"], :name => "index_identities_on_provider_and_uid", :unique => true
  add_index "identities", ["user_id"], :name => "index_identities_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "tagline"
    t.text     "description"
    t.string   "main_image"
    t.string   "template_id"
    t.integer  "owner_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug", :unique => true

  create_table "templates", :force => true do |t|
    t.string   "name"
    t.string   "class_name"
    t.text     "description"
    t.integer  "created_by_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_picture"
    t.boolean  "admin",                  :default => false
    t.string   "slug"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["slug"], :name => "index_users_on_slug", :unique => true

end
