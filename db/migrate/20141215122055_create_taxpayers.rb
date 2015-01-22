class CreateTaxpayers < ActiveRecord::Migration
  def change
    create_table :taxpayers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :email
      t.string :mobile_number
      t.string :telephone_number
      t.string :tin_number
      t.string :workflow_state
      t.string :cedula_number
      t.string :address_bldg_no
      t.string :address_unit_no
      t.string :address_street
      t.string :address_barangay
      t.string :address_subdivision
      t.string :address_municipality
      t.string :address_province
      t.string :cedula_place_issued
      t.date :cedula_date_issued
      t.integer :status

      t.timestamps null: false
    end
  end
end
