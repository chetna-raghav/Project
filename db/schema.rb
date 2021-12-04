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

ActiveRecord::Schema.define(version: 2021_12_04_064843) do

  create_table "businfo_users", force: :cascade do |t|
    t.string "boardingPoint"
    t.time "time"
    t.integer "user_id", null: false
    t.integer "businfo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["businfo_id"], name: "index_businfo_users_on_businfo_id"
    t.index ["user_id"], name: "index_businfo_users_on_user_id"
  end

  create_table "businfos", force: :cascade do |t|
    t.integer "Bus_Number"
    t.string "Bus_Name"
    t.string "Source"
    t.string "Destination"
    t.integer "Number_Of_Seats"
    t.integer "Remaining_Seats"
    t.integer "Price"
    t.date "Date"
    t.time "Time"
    t.integer "Time_taken"
    t.integer "busowner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "boarding1"
    t.time "time1"
    t.string "boarding2"
    t.string "time2"
    t.string "boarding3"
    t.time "time3"
    t.integer "Availableseats"
    t.index ["busowner_id"], name: "index_businfos_on_busowner_id"
  end

  create_table "busowners", force: :cascade do |t|
    t.text "email", null: false
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "Availableseats"
  end

  create_table "users", force: :cascade do |t|
    t.text "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "phone"
    t.string "name"
  end

  create_table "wait_lists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "businfo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["businfo_id"], name: "index_wait_lists_on_businfo_id"
    t.index ["user_id"], name: "index_wait_lists_on_user_id"
  end

  add_foreign_key "businfo_users", "businfos"
  add_foreign_key "businfo_users", "users"
  add_foreign_key "businfos", "busowners"
  add_foreign_key "wait_lists", "businfos"
  add_foreign_key "wait_lists", "users"
end
