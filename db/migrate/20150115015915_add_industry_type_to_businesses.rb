class AddIndustryTypeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :industry_type, :integer
  end
end
