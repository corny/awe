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

ActiveRecord::Schema.define(:version => 20120305185058) do

  create_table "courses", :force => true do |t|
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.integer  "course_id",  :null => false
    t.integer  "project_id"
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "groups", ["course_id", "id"], :name => "index_groups_on_course_id_and_id", :unique => true
  add_index "groups", ["course_id", "name"], :name => "index_groups_on_course_id_and_name", :unique => true

  create_table "projects", :force => true do |t|
    t.integer  "course_id",   :null => false
    t.string   "name",        :null => false
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "projects", ["course_id", "id"], :name => "index_projects_on_course_id_and_id", :unique => true
  add_index "projects", ["course_id", "name"], :name => "index_projects_on_course_id_and_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "identity_url"
    t.integer  "matriculation"
    t.string   "degree_program"
    t.boolean  "admin",          :default => false, :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.integer  "course_id"
    t.integer  "group_id"
  end

  add_index "users", ["course_id"], :name => "index_users_on_course_id"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["group_id"], :name => "index_users_on_group_id"
  add_index "users", ["identity_url"], :name => "index_users_on_identity_url", :unique => true
  add_index "users", ["matriculation"], :name => "index_users_on_matriculation"

  add_foreign_key "groups", "courses", :name => "groups_course_id_fk", :dependent => :delete
  add_foreign_key "groups", "projects", :name => "groups_project_id_fkey", :dependent => :nullify

  add_foreign_key "projects", "courses", :name => "projects_course_id_fk", :dependent => :delete

  add_foreign_key "users", "courses", :name => "users_course_id_fk"
  add_foreign_key "users", "groups", :name => "users_group_id_fk"
  add_foreign_key "users", "groups", :name => "users_group_id_fkey", :dependent => :nullify

end
