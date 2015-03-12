class AddBarangayClearanceToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :barangay_clearance, :boolean
  end
end
