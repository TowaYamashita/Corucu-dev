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

ActiveRecord::Schema.define(version: 2020_04_19_071828) do

  create_table "add_examinations", force: :cascade do |t|
    t.string "category"
    t.integer "subject_id"
    t.string "place"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.date "scheduled_at"
    t.index ["subject_id"], name: "index_add_examinations_on_subject_id"
    t.index ["user_id"], name: "index_add_examinations_on_user_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.boolean "admin_flag", default: false, null: false
    t.boolean "professor_flag", default: false, null: false
    t.boolean "student_flag", default: false, null: false
    t.boolean "guest_flag", default: false, null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string "course"
    t.string "instructor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "substitutes", force: :cascade do |t|
    t.date "changed_at"
    t.integer "period"
    t.integer "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.text "comment"
    t.index ["subject_id"], name: "index_substitutes_on_subject_id"
    t.index ["user_id"], name: "index_substitutes_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.integer "hint"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "status_id"
    t.boolean "admin_user", default: false, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["status_id"], name: "index_users_on_status_id"
  end

end
