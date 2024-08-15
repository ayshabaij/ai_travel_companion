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

ActiveRecord::Schema.define(version: 2024_08_13_181407) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessibilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dietary_restrictions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hobbies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hobbies_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "hobby_id", null: false
    t.index %w[hobby_id user_id], name: "index_hobbies_users_on_hobby_id_and_user_id"
    t.index %w[user_id hobby_id], name: "index_hobbies_users_on_user_id_and_hobby_id"
  end

  create_table "locations", force: :cascade do |t|
    t.bigint "hobby_id", null: false
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hobby_id"], name: "index_locations_on_hobby_id"
  end

  create_table "user_accessibilities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "accessibility_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["accessibility_id"], name: "index_user_accessibilities_on_accessibility_id"
    t.index ["user_id"], name: "index_user_accessibilities_on_user_id"
  end

  create_table "user_dietary_restrictions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "dietary_restriction_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dietary_restriction_id"], name: "index_user_dietary_restrictions_on_dietary_restriction_id"
    t.index ["user_id"], name: "index_user_dietary_restrictions_on_user_id"
  end

  create_table "user_hobbies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "hobby_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hobby_id"], name: "index_user_hobbies_on_hobby_id"
    t.index ["user_id"], name: "index_user_hobbies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone_number"
    t.string "verification_code"
    t.date "date_of_birth"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "locations", "hobbies"
  add_foreign_key "user_accessibilities", "accessibilities"
  add_foreign_key "user_accessibilities", "users"
  add_foreign_key "user_dietary_restrictions", "dietary_restrictions"
  add_foreign_key "user_dietary_restrictions", "users"
  add_foreign_key "user_hobbies", "hobbies"
  add_foreign_key "user_hobbies", "users"
end
