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

ActiveRecord::Schema.define(version: 2019_09_04_000228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hunters", force: :cascade do |t|
    t.string "name"
    t.integer "harm"
    t.integer "luck"
    t.integer "experience"
    t.integer "charm"
    t.integer "cool"
    t.integer "sharp"
    t.integer "tough"
    t.integer "weird"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "playbooks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "playbook_id"
    t.integer "charm"
    t.integer "cool"
    t.integer "sharp"
    t.integer "tough"
    t.integer "weird"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playbook_id"], name: "index_ratings_on_playbook_id"
  end

  add_foreign_key "ratings", "playbooks"
end
