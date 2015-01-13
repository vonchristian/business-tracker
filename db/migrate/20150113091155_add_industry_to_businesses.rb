class AddIndustryToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :industry, :integer
  end
end
