class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.integer :taxpayer_id
      t.integer :status
      t.decimal :asset_size
      t.integer :enterprise_scale
      t.integer :type_of_organization
      t.string :address_sitio
      t.string :address_street
      t.string :address_barangay
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
      t.integer :business_area
      t.string :first_name_lessor
      t.string :middle_name_lessor
      t.string :last_name_lessor
      t.integer :monthly_rental
      t.string :permit_number
      t.decimal :gross_sales
      t.integer :industry_type
      t.integer :business_type
      t.decimal :capital
      t.decimal :capital_tax
      t.boolean :bir_registered
      t.boolean :police_clearance_cleared
      t.boolean :sanitary_inspection_cleared
      t.boolean :health_certificate_cleared
      t.string :logo_id
      t.timestamps null: false
    end
  end
end
