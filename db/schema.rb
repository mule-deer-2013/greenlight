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

ActiveRecord::Schema.define(:version => 20131002035357) do

  create_table "distances", :force => true do |t|
    t.integer "current_user_id"
    t.integer "other_user_id"
    t.integer "distance"
  end

  create_table "matches", :force => true do |t|
    t.integer "user_1"
    t.integer "user_2"
    t.string  "user_1_vote"
    t.string  "user_2_vote"
    t.string  "match_status", :default => "Pending"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "age"
    t.string   "email"
    t.string   "sex"
    t.string   "sex_preference"
    t.string   "tagline"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "password_digest"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.float    "longitude",          :default => 0.0
    t.float    "latitude",           :default => 0.0
    t.string   "location"
  end

  create_table "users_votes", :force => true do |t|
    t.integer "user_id"
    t.integer "vote_id"
  end

  create_table "votes", :force => true do |t|
    t.integer  "voter_id"
    t.integer  "voted_on_id"
    t.string   "opinion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "votes", ["voter_id"], :name => "index_votes_on_voter_id"

end
