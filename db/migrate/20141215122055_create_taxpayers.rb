class CreateTaxpayers < ActiveRecord::Migration
  def change
    create_table :taxpayers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :civil_status
      t.date   :date_of_birth
      t.string :place_of_birth
      t.string :occupation
      t.string :gender
      t.string :profile_image_id

      t.string :email
      t.string :mobile_number
      t.string :tin_number
      t.string :cedula_number
      t.string :address_sitio
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
