class AddMayorsPermitFeeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :mayors_permit_fee_id, :integer
  end
end
