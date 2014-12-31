class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
    	t.string :house_number_or_bldg_number
    	t.string :building_name
      t.string :unit_number
      t.string :street
      t.string :barangay
      t.string :subdivision
      t.string :municipality_or_city
      t.string :province
      t.references :addressable, polymorphic: true
    end
  end
end
