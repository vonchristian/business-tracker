class AddOwnerIdIndexToBusinesses < ActiveRecord::Migration
  def change
     add_index :businesses, :owner_id
  end
end
