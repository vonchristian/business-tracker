class AddBusinessTypeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :business_type, :integer
  end
end
