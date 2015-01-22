class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :taxpayer_id
      t.integer :status
      t.decimal :asset_size
      t.integer :enterprise_scale
      t.integer :type_of_organization
      t.string :address_bldg_no
      t.string :address_unit_no
      t.string :address_street
      t.string :address_barangay
      t.string :address_subdivision
      t.string :address_municipality
      t.string :address_province
      t.date   :application_date
      t.integer :dti_sec_reg_no
      t.date :dti_sec_reg_date
      t.string :president_first_name
      t.string :president_middle_name
      t.string :president_last_name

      t.string :business_name

      t.string :position
      t.integer :no_of_employees
      t.integer :phone_no
      t.integer :pin_no
      t.integer :business_area
      t.integer :no_of_employees_lgu
      t.string :first_name_lessor
      t.string :middle_name_lessor
      t.string :last_name_lessor
      t.integer :monthly_rental
      t.boolean :tax_incentive
      t.boolean :rented
      t.boolean :franchised
      t.boolean :branch
      t.string :permit_number
      t.decimal :gross_sales
      t.integer :industry_type
      t.integer :business_type
      t.decimal :capital
      t.decimal :capital_tax

      t.timestamps null: false
    end
  end
end
