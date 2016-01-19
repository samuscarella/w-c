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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160111210509) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "equipment", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "sets"
    t.integer  "reps"
    t.integer  "user_id"
    t.integer  "workout_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "difficulty"
    t.string   "equipment"
  end

  add_index "exercises", ["user_id"], name: "index_exercises_on_user_id", using: :btree
  add_index "exercises", ["workout_id"], name: "index_exercises_on_workout_id", using: :btree

  create_table "targeted_muscles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "targeted_muscles_workouts", id: false, force: true do |t|
    t.integer "targeted_muscle_id", null: false
    t.integer "workout_id",         null: false
  end

  create_table "tips", force: true do |t|
    t.string   "name"
    t.integer  "exercise_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tips", ["exercise_id"], name: "index_tips_on_exercise_id", using: :btree
  add_index "tips", ["user_id"], name: "index_tips_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "password_digest"
  end

  create_table "workouts", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "difficulty"
    t.string   "duration"
    t.string   "targeted_muscles"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "equipment"
  end

  add_index "workouts", ["user_id"], name: "index_workouts_on_user_id", using: :btree

end
