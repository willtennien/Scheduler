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

ActiveRecord::Schema.define(:version => 20120626153438) do

  create_table "available_times", :force => true do |t|
    t.integer  "user_id"
    t.string   "value_str"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "instrument_names", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "instrument_requirements", :force => true do |t|
    t.integer  "instrument_name_id"
    t.integer  "project_requirement_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "instruments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "instrument_name_id"
    t.integer  "project_solution_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "project_requirements", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "duration"
    t.integer  "project_solution_id"
    t.integer  "soundproofness_id"
    t.integer  "user_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "project_solutions", :force => true do |t|
    t.integer  "project_requirement_id"
    t.integer  "user_id"
    t.integer  "space_id"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "schedulers", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "soundproofnesses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spaces", :force => true do |t|
    t.integer  "soundproofness_id"
    t.integer  "user_id"
    t.integer  "project_solution_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "available_time_id"
    t.string   "username"
    t.string   "password"
    t.string   "password_digest"
    t.string   "name"
    t.string   "email"
    t.string   "bio"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

end
