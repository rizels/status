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

ActiveRecord::Schema.define(:version => 20130321023652) do

  create_table "accounts", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "image"
    t.string   "role"
  end

  create_table "comments", :force => true do |t|
    t.string   "commenter"
    t.text     "body"
    t.integer  "statusupdate_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.time     "deleted_at"
  end

  add_index "comments", ["statusupdate_id"], :name => "index_comments_on_statusupdate_id"

  create_table "detailinfos", :force => true do |t|
    t.integer  "info_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "infos", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "statusupdates", :force => true do |t|
    t.string   "username"
    t.text     "content"
    t.datetime "updatetime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.time     "deleted_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
