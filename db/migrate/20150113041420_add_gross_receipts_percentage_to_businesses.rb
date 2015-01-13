class AddGrossReceiptsPercentageToBusinesses < ActiveRecord::Migration
  def up
     add_column :businesses, :gross_receipts, :decimal
    add_column :businesses, :gross_receipts_percentage, :decimal
  end

   def down
     add_column :businesses, :gross_receipts, :decimal
    add_column :businesses, :gross_receipts_percentage, :decimal
  end

end
