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

ActiveRecord::Schema.define(:version => 20130601024211) do

  create_table "acts", :force => true do |t|
    t.integer  "act_number"
    t.integer  "play_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "acts", ["play_id"], :name => "index_acts_on_play_id"

  create_table "castings", :force => true do |t|
    t.integer  "actor_id"
    t.integer  "character_id"
    t.integer  "production_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "castings", ["actor_id"], :name => "index_castings_on_actor_id"
  add_index "castings", ["character_id"], :name => "index_castings_on_character_id"
  add_index "castings", ["production_id"], :name => "index_castings_on_production_id"

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.boolean  "is_female"
    t.integer  "age"
    t.integer  "play_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "characters", ["play_id"], :name => "index_characters_on_play_id"

  create_table "french_scenes", :force => true do |t|
    t.string   "french_scene_number"
    t.integer  "play_id"
    t.integer  "act_id"
    t.integer  "scene_id"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "french_scenes", ["act_id"], :name => "index_french_scenes_on_act_id"
  add_index "french_scenes", ["play_id"], :name => "index_french_scenes_on_play_id"
  add_index "french_scenes", ["scene_id"], :name => "index_french_scenes_on_scene_id"

  create_table "on_stages", :force => true do |t|
    t.integer  "character_id"
    t.integer  "french_scene_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "on_stages", ["character_id"], :name => "index_on_stages_on_character_id"
  add_index "on_stages", ["french_scene_id"], :name => "index_on_stages_on_french_scene_id"

  create_table "plays", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "productions", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "play_id"
    t.integer  "theater_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "productions", ["play_id"], :name => "index_productions_on_play_id"
  add_index "productions", ["theater_id"], :name => "index_productions_on_theater_id"

  create_table "scenes", :force => true do |t|
    t.integer  "scene_number"
    t.integer  "play_id"
    t.integer  "act_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "scenes", ["act_id"], :name => "index_scenes_on_act_id"
  add_index "scenes", ["play_id"], :name => "index_scenes_on_play_id"

  create_table "spaces", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "seating_capacity"
    t.integer  "theater_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "spaces", ["theater_id"], :name => "index_spaces_on_theater_id"

  create_table "theaters", :force => true do |t|
    t.string   "name"
    t.string   "street_address"
    t.string   "state"
    t.string   "zip"
    t.text     "mission_statement"
    t.string   "phone_number"
    t.string   "website"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "city"
  end

  create_table "users", :force => true do |t|
    t.date     "date_of_birth"
    t.string   "job"
    t.date     "hire_date"
    t.string   "type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "best_role"
    t.boolean  "is_female"
    t.string   "uid"
    t.string   "image"
  end

end
