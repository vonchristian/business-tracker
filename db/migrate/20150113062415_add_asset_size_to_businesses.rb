class AddAssetSizeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :asset_size, :integer
    add_column :businesses, :workforce_size, :integer
  end
end
