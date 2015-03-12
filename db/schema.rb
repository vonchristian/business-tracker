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

ActiveRecord::Schema.define(version: 20150312005213) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "businesses", force: :cascade do |t|
    t.integer  "taxpayer_id"
    t.integer  "status"
    t.decimal  "asset_size"
    t.integer  "enterprise_scale"
    t.integer  "type_of_organization"
    t.string   "address_sitio"
    t.string   "address_street"
    t.string   "address_barangay"
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
    t.integer  "business_area"
    t.string   "first_name_lessor"
    t.string   "middle_name_lessor"
    t.string   "last_name_lessor"
    t.integer  "monthly_rental"
    t.string   "permit_number"
    t.decimal  "gross_sales"
    t.integer  "industry_type"
    t.integer  "business_type"
    t.decimal  "capital"
    t.decimal  "capital_tax"
    t.boolean  "bir_registered"
    t.boolean  "police_clearance_cleared"
    t.boolean  "sanitary_inspection_cleared"
    t.boolean  "health_certificate_cleared"
    t.string   "logo_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "renting"
    t.integer  "type_of_business"
    t.boolean  "revoked",                     default: false, null: false
    t.datetime "revoked_at"
    t.text     "reason_of_revocation"
    t.datetime "renewed_at"
    t.boolean  "barangay_clearance"
  end

  create_table "cedulas", force: :cascade do |t|
    t.decimal  "basic_community_tax"
    t.decimal  "additional_tax"
    t.decimal  "gross_receipts_of_business"
    t.decimal  "income_from_real_property"
    t.decimal  "gross_receipts_of_earnings"
    t.integer  "taxpayer_id"
    t.decimal  "subtotal"
    t.decimal  "interest"
    t.decimal  "total_amount"
    t.string   "place_of_issue"
    t.date     "date_of_issue"
    t.string   "citizenship"
    t.integer  "civil_status"
    t.integer  "gender"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.string   "height"
    t.string   "weight"
    t.string   "occupation"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "cedulas", ["taxpayer_id"], name: "index_cedulas_on_taxpayer_id", using: :btree

  create_table "gross_sales_taxes", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "line_of_businesses", force: :cascade do |t|
    t.integer  "business_id"
    t.string   "description"
    t.string   "psic_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mayors_permit_fees", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "payments", force: :cascade do |t|
    t.decimal  "amount"
    t.integer  "business_id"
    t.integer  "status"
    t.string   "official_receipt_number"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "collecting_officer"
  end

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "police_clearances", force: :cascade do |t|
    t.text     "other_identification_marks"
    t.text     "remarks"
    t.string   "purpose"
    t.string   "build"
    t.string   "height"
    t.string   "weight"
    t.integer  "taxpayer_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "taxpayers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "civil_status"
    t.date     "date_of_birth"
    t.string   "place_of_birth"
    t.string   "occupation"
    t.string   "gender"
    t.string   "profile_image_id"
    t.string   "email"
    t.string   "mobile_number"
    t.string   "tin_number"
    t.string   "cedula_number"
    t.string   "address_sitio"
    t.string   "address_street"
    t.string   "address_barangay"
    t.string   "address_subdivision"
    t.string   "address_municipality"
    t.string   "address_province"
    t.string   "cedula_place_issued"
    t.date     "cedula_date_issued"
    t.integer  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

  create_table "type_of_organizations", force: :cascade do |t|
    t.integer  "business_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "profile_image_id"
    t.integer  "role"
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
