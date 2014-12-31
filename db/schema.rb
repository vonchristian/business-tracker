
ActiveRecord::Schema.define(version: 20141230140930) do

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

  create_table "businesses", force: :cascade do |t|
    t.integer  "taxpayer_id"
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
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
