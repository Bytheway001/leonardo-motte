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

ActiveRecord::Schema[7.2].define(version: 2024_09_21_203806) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "li_public"
    t.string "alias"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "education_histories", force: :cascade do |t|
    t.bigint "school_id"
    t.string "title"
    t.date "start_date"
    t.date "degree_date"
    t.boolean "undergrad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_id"], name: "index_education_histories_on_school_id"
  end

  create_table "employment_histories", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.boolean "primary"
    t.boolean "current"
    t.bigint "contact_id"
    t.bigint "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "school_id"
    t.string "title"
    t.date "degree_date"
    t.boolean "undergrad"
    t.index ["company_id"], name: "index_employment_histories_on_company_id"
    t.index ["contact_id"], name: "index_employment_histories_on_contact_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "contact_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id", "role_id"], name: "index_matches_on_contact_id_and_role_id", unique: true
    t.index ["contact_id"], name: "index_matches_on_contact_id"
    t.index ["role_id"], name: "index_matches_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.date "start_date"
    t.date "placement_date"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "matches", "contacts"
  add_foreign_key "matches", "roles"
end
