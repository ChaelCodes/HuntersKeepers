# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 2019_10_27_135117) do

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
    t.bigint "playbook_id"
    t.index ["playbook_id"], name: "index_hunters_on_playbook_id"
  end

  create_table "hunters_improvements", force: :cascade do |t|
    t.string "hunters_improvements"
    t.integer "hunter_id"
    t.integer "improvement_id"
    t.string "improvable_type"
    t.bigint "improvable_id"
    t.index ["improvable_type", "improvable_id"], name: "index_hunters_improvements_on_improvable_type_and_improvable_id"
  end

  create_table "hunters_moves", force: :cascade do |t|
    t.string "hunters_moves"
    t.bigint "hunter_id"
    t.bigint "move_id"
    t.index ["hunter_id"], name: "index_hunters_moves_on_hunter_id"
    t.index ["move_id"], name: "index_hunters_moves_on_move_id"
  end

  create_table "improvements", force: :cascade do |t|
    t.string "description"
    t.string "type"
    t.integer "rating"
    t.integer "stat_limit"
    t.bigint "playbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playbook_id"], name: "index_improvements_on_playbook_id"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.string "six_and_under"
    t.string "seven_to_nine"
    t.string "ten_plus"
    t.string "twelve_plus"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "playbook_id"
    t.string "description"
    t.index ["playbook_id"], name: "index_moves_on_playbook_id"
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

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "hunters", "playbooks"
  add_foreign_key "hunters_moves", "hunters"
  add_foreign_key "hunters_moves", "moves"
  add_foreign_key "improvements", "playbooks"
  add_foreign_key "moves", "playbooks"
  add_foreign_key "ratings", "playbooks"
end
