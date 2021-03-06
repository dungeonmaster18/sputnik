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

ActiveRecord::Schema.define(version: 2018_08_09_150259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.boolean "is_verified"
    t.string "token"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "assigned_to"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.boolean "is_enabled"
  end

  create_table "histories", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "gender"
    t.date "dob"
    t.string "driving_license"
    t.string "vehicle_registration_card"
    t.string "status"
    t.string "city"
    t.bigint "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "rejection_reason"
    t.integer "assigned_to"
  end

  create_table "seed_migration_data_migrations", id: :serial, force: :cascade do |t|
    t.string "version"
    t.integer "runtime"
    t.datetime "migrated_on"
  end

  create_table "user_infos", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "gender"
    t.date "dob"
    t.bigint "mobile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "driving_license"
    t.string "vehicle_registration_card"
    t.string "city"
    t.string "status", default: "Not Applied"
    t.integer "assigned_to"
    t.string "rejection_reason"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password"
    t.string "salt"
    t.string "token"
    t.boolean "is_verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
