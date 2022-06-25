# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_06_25_052303) do

  create_table "comments", charset: "utf8mb3", force: :cascade do |t|
    t.string "comment_content"
    t.bigint "user_id", null: false
    t.bigint "search_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["search_id"], name: "index_comments_on_search_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "protections", charset: "utf8mb3", force: :cascade do |t|
    t.json "protection_images"
    t.string "protection_title"
    t.string "protection_breed"
    t.text "protection_profile"
    t.text "protection_place"
    t.date "protection_date"
    t.text "protection_contact"
    t.string "protection_choker"
    t.string "protection_dogtag"
    t.text "contacted_institution"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
  end

  create_table "searches", charset: "utf8mb3", force: :cascade do |t|
    t.string "dog_name"
    t.string "dog_breed"
    t.integer "dog_age"
    t.text "dog_profile"
    t.text "disappeared_place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "contact"
    t.json "dog_images"
    t.string "search_title"
    t.date "disappeared_date"
    t.integer "user_id"
  end

  create_table "sights", charset: "utf8mb3", force: :cascade do |t|
    t.integer "user_id"
    t.string "sight_title"
    t.text "sight_profile"
    t.text "sight_place"
    t.date "sight_date"
    t.json "sight_images"
    t.text "sight_contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "searches"
  add_foreign_key "comments", "users"
end
