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

ActiveRecord::Schema[7.0].define(version: 2023_04_10_005248) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "patient_procedures", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "procedure_id", null: false
    t.bigint "user_id", null: false
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_patient_procedures_on_patient_id"
    t.index ["procedure_id"], name: "index_patient_procedures_on_procedure_id"
    t.index ["user_id"], name: "index_patient_procedures_on_user_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "patient_id", default: "", null: false
    t.string "case_id", default: "", null: false
    t.string "name", default: "", null: false
    t.string "father_husband", default: ""
    t.integer "gender"
    t.integer "age"
    t.string "address", default: ""
    t.boolean "done", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "referrer_id"
    t.text "image_data"
    t.index ["referrer_id"], name: "index_patients_on_referrer_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "procedure_type", null: false
    t.string "title", null: false
    t.integer "price", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "referrers", force: :cascade do |t|
    t.string "doctor_name"
    t.string "hospital_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name", null: false
    t.string "encrypted_password", default: "", null: false
    t.integer "role", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "patient_procedures", "patients"
  add_foreign_key "patient_procedures", "procedures"
  add_foreign_key "patient_procedures", "users"
end
