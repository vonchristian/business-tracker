# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150112133600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "subdomain"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", force: :cascade do |t|
    t.string  "house_number_or_bldg_number"
    t.string  "building_name"
    t.string  "unit_number"
    t.string  "street"
    t.string  "barangay"
    t.string  "subdivision"
    t.string  "municipality_or_city"
    t.string  "province"
    t.integer "addressable_id"
    t.string  "addressable_type"
  end

  create_table "business_nature_taxes", force: :cascade do |t|
    t.integer  "tax_id"
    t.integer  "business_nature_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "business_natures", force: :cascade do |t|
    t.string   "description"
    t.string   "psic_code"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "businesses", force: :cascade do |t|
    t.integer  "owner_id"
    t.integer  "type_of_organization_id"
    t.string   "address_bldg_no"
    t.string   "address_unit_no"
    t.string   "address_street"
    t.string   "address_barangay"
    t.string   "address_subdivision"
    t.string   "address_municipality"
    t.string   "address_province"
    t.date     "application_date"
    t.integer  "dti_sec_reg_no"
    t.date     "dti_sec_reg_date"
    t.string   "president_first_name"
    t.string   "president_middle_name"
    t.string   "president_last_name"
    t.string   "business_name"
    t.string   "position"
    t.integer  "no_of_employees"
    t.integer  "phone_no"
    t.integer  "pin_no"
    t.integer  "business_area"
    t.integer  "no_of_employees_lgu"
    t.integer  "psic_code"
    t.integer  "capital_for_business"
    t.string   "first_name_lessor"
    t.string   "middle_name_lessor"
    t.string   "last_name_lessor"
    t.integer  "monthly_rental"
    t.boolean  "tax_incentive"
    t.boolean  "rented"
    t.boolean  "franchised"
    t.boolean  "branch"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "workflow_state"
    t.integer  "business_nature_id"
  end

  add_index "businesses", ["owner_id"], name: "index_businesses_on_owner_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "description"
    t.string   "office"
    t.date     "date_issued"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "lessors", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.decimal  "monthly_rental"
    t.string   "building_number"
    t.string   "street"
    t.string   "barangay"
    t.string   "subdivision"
    t.string   "city_or_municipality"
    t.string   "province"
    t.string   "email"
    t.string   "mobile_number"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lessors", ["business_id"], name: "index_lessors_on_business_id", using: :btree

  create_table "line_of_businesses", force: :cascade do |t|
    t.integer  "business_id"
    t.integer  "business_nature_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "line_of_businesses", ["business_id"], name: "index_line_of_businesses_on_business_id", using: :btree
  add_index "line_of_businesses", ["business_nature_id"], name: "index_line_of_businesses_on_business_nature_id", using: :btree

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "business_id"
    t.integer  "taxpayer_id"
    t.integer  "tax_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "official_receipt_number"
    t.integer  "status"
  end

  create_table "required_documents", force: :cascade do |t|
    t.string   "description"
    t.string   "office"
    t.date     "date_issued"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "revenues", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "tax_id"
    t.integer  "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tax_categorizations", force: :cascade do |t|
    t.integer  "business_nature_id"
    t.integer  "tax_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "taxes", force: :cascade do |t|
    t.string   "description"
    t.boolean  "default"
    t.integer  "business_id"
    t.decimal  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "taxpayers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "telephone_number"
    t.string   "tin"
    t.string   "workflow_state"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "full_name"
    t.string   "cedula_number"
    t.string   "tin_number"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
