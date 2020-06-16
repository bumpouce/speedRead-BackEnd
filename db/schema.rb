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

ActiveRecord::Schema.define(version: 2020_06_16_221018) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "notes", force: :cascade do |t|
    t.bigint "user_reading_id", null: false
    t.text "skim"
    t.text "comprehension"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_reading_id"], name: "index_notes_on_user_reading_id"
  end

  create_table "readings", force: :cascade do |t|
    t.string "category"
    t.string "level"
    t.string "author"
    t.string "title"
    t.text "completeText"
    t.string "source"
    t.string "contributor"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "wordCount"
  end

  create_table "user_readings", force: :cascade do |t|
    t.bigint "reading_id", null: false
    t.bigint "user_id", null: false
    t.integer "position"
    t.integer "skimWPM"
    t.integer "deepWPM"
    t.integer "comprehensionRating"
    t.integer "paceRating"
    t.datetime "created"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reading_id"], name: "index_user_readings_on_reading_id"
    t.index ["user_id"], name: "index_user_readings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "password_digest"
    t.boolean "agreement"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "notes", "user_readings"
  add_foreign_key "user_readings", "readings"
  add_foreign_key "user_readings", "users"
end
