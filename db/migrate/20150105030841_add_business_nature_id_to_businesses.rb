class AddBusinessNatureIdToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :business_nature_id, :integer
  end
end
