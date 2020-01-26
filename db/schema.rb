# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_26_141817) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gears", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "harm"
    t.integer "armor"
    t.bigint "playbook_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["playbook_id"], name: "index_gears_on_playbook_id"
  end

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

  create_table "hunters_gears", force: :cascade do |t|
    t.bigint "hunter_id"
    t.bigint "gear_id"
    t.index ["gear_id"], name: "index_hunters_gears_on_gear_id"
    t.index ["hunter_id"], name: "index_hunters_gears_on_hunter_id"
  end

  create_table "hunters_improvements", force: :cascade do |t|
    t.string "hunters_improvements"
    t.integer "hunter_id"
    t.integer "improvement_id"
    t.string "improvable_type"
    t.bigint "improvable_id"
    t.jsonb "improveable"
    t.index ["improvable_type", "improvable_id"], name: "index_hunters_improvements_on_improvable_type_and_improvable_id"
  end

  create_table "hunters_moves", force: :cascade do |t|
    t.string "hunters_moves"
    t.bigint "hunter_id"
    t.bigint "move_id"
    t.boolean "advanced"
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
    t.boolean "advanced"
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

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "taggings_taggable_context_idx"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
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

  add_foreign_key "gears", "playbooks"
  add_foreign_key "hunters", "playbooks"
  add_foreign_key "hunters_gears", "gears"
  add_foreign_key "hunters_gears", "hunters"
  add_foreign_key "hunters_moves", "hunters"
  add_foreign_key "hunters_moves", "moves"
  add_foreign_key "improvements", "playbooks"
  add_foreign_key "moves", "playbooks"
  add_foreign_key "ratings", "playbooks"
  add_foreign_key "taggings", "tags"
end
