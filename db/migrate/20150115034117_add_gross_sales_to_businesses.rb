class AddGrossSalesToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :gross_sales, :decimal
  end
end
